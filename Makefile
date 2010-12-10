LUA_DIR=/usr/local
LUA_LIBDIR=$(LUA_DIR)/lib/lua/5.1
LIBFLAG= -shared -fpic

hello.so:	hello.c
	$(CC) -o hello.so $(LIBFLAG) $(CFLAGS) hello.c -I$(LUA_LIBDIR) -llua

clean:
	$(RM) hello.so

test: hello.so
	shake test.lua

rock:
	luarocks make hello-scm-1.rockspec
