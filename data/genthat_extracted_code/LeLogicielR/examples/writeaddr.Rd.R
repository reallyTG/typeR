library(LeLogicielR)


### Name: writeaddr
### Title: Writing a value at some memory address
### Aliases: writeaddr itoAddr

### ** Examples

## Not run: 
##D x <- c(8L,9L)
##D addr <- getaddr(x)$addr.int # Gets the address of the first
##D                             # box of the 64-box block where x
##D                             # is stored.
##D addr
##D writeaddr(addr,6L) # Write the integer 6 at this address.
##D x
##D writeaddr(addr+4L,7L) # An integer is coded over 4 bytes,
##D                       # hence increment the address by 4 to
##D                       # get to x[2].
##D x
##D x <- c(12.8,4.5)
##D x
##D addr <- getaddr(x)$addr.int # Get the address of the first box
##D                             # of the 128-box block where x is
##D                             # stored.
##D writeaddr(addr,6.2)
##D x
##D writeaddr(addr+8L,7.1) # A double is coded over 8 bytes.
##D x
## End(Not run)



