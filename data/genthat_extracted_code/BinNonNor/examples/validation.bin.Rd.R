library(BinNonNor)


### Name: validation.bin
### Title: Validates the marginal specification of the binary variables
### Aliases: validation.bin

### ** Examples

n.B<-2
prop.vec=c(0.5,0.6)
validation.bin(n.B,prop.vec)

## Not run: 
##D n.B<-3
##D prop.vec=c(0.5,0.6)
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-3
##D prop.vec=c(0.5,0.6)
##D validation.bin(n.B)
##D 
##D n.B<-0
##D prop.vec=c(0.5,0.6)
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-3
##D prop.vec=c(0.5,0.6)
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-3
##D prop.vec=NULL
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-3
##D prop.vec=c(1,1.5,-1.5)
##D validation.bin(n.B,prop.vec)
## End(Not run)



