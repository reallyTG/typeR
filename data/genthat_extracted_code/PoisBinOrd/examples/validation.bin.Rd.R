library(PoisBinOrd)


### Name: validation.bin
### Title: Validates the marginal specification of the binary variables
### Aliases: validation.bin

### ** Examples

n.B<-3
prop.vec<-c(0.25,0.5,0.75)
validation.bin(n.B,prop.vec)

## Not run: 
##D n.B<-3
##D validation.bin(n.B)
##D 
##D n.B<--3
##D prop.vec<-c(0.25,0.5,0.75)
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-0
##D prop.vec<-c(0.25,0.5,0.75)
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-5
##D prop.vec<-c(0.25,0.5,0.75)
##D validation.bin(n.B,prop.vec)
##D 
##D n.B<-3
##D prop.vec<-c(0.25,0.5,-0.75)
##D validation.bin(n.B,prop.vec)
## End(Not run)



