library(LeLogicielR)


### Name: VectorAddr
### Title: Address of vector
### Aliases: getaddr VectorAddr print.VectorAddr update.VectorAddr
###   Ops.VectorAddr getAddrDbl getAddrInt printAddr writeAtAddrDbl
###   writeAtAddrInt

### ** Examples

## Not run: 
##D x <- c(8L,9L)
##D addr <- VectorAddr(x)		# Gets the address of the first
##D                             # box of the 64-box block where x
##D                             # is stored.
##D addr
##D update(addr,6L) # Write the integer 6 at this address.
##D x
##D update(addr+4L,7L) # An integer is coded over 4 bytes,
##D                       # hence increment the address by 4 to
##D                       # get to x[2].
##D x
##D x <- c(12.8,4.5)
##D x
##D addr <- VectorAddr(x)		# Get the address of the first box
##D                             # of the 128-box block where x is
##D                             # stored.
##D update(addr,6.2)
##D x
##D update(addr+8L,7.1) # A double is coded over 8 bytes.
##D x
## End(Not run)



