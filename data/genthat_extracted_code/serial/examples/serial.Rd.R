library(serial)


### Name: serial
### Title: A serial communication interface for R.
### Aliases: serial serial-package

### ** Examples

# for this example I used the 'null-modem' emulator 'com0com' for Windows
# which is available on 'http://com0com.sourceforge.net/'
# Here the pair of com-ports is 'CNCA0' <-> 'CNCB0'

# Test the functionality:
# ======================
#
# first: install the virtual null-modem connection like
#        com0com (win) or tty0tty (linux)
#        Hint: Some unix insist on port names like 'ttyS[n]'.
# 
# second: setup a terminal program (like HTerm or gtkterm) and listen to 
#         com-port 'CNCB0' (or what ever you have installed)
#         or (for unix only) 'cat /dev/tnt1' will output tnt1 to console

## Not run: 
##D 
##D # Now configure one of the com-ports with appropriate connection properties
##D con <- serialConnection(name = "testcon",port = "CNCA0"
##D                        ,mode = "115200,n,8,1"
##D                        ,newline = 1
##D                        ,translation = "crlf"
##D                        )
##D 
##D # let's open the serial interface
##D 
##D open(con)
##D 
##D # write some stuff
##D write.serialConnection(con,"Hello World!")
##D 
##D # read, in case something came in
##D read.serialConnection(con)
##D 
##D # close the connection
##D close(con)
##D 
##D 
##D 
##D # Reading and writing binary (hexadecimal) data
##D # remember: Everything is a string, so you might need data conversation
##D 
##D con <- serialConnection(name = "testcon",port = "CNCA0"
##D                        ,mode = "115200,n,8,1"
##D                        ,translation = "binary" # switches to binary data
##D                        )
##D 
##D # let's open the serial interface
##D 
##D open(con)
##D 
##D # write some stuff
##D write.serialConnection(con, rawToChar(as.raw(15)) ) # 0x0F
##D write.serialConnection(con, c(15,20) ) # 0x0F, 0x14
##D write.serialConnection(con, c(0x6F,0x6C) )
##D 
##D # read, in case something came in
##D # the output is always a character vector
##D a <- read.serialConnection(con)
##D 
##D # convert the character vector to hexadecimal (raw) values
##D print(a)
##D 
##D # close the connection
##D close(con)
##D 
## End(Not run)



