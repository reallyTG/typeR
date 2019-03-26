library(PoisBinOrd)


### Name: validation.ord
### Title: Validates the marginal specification of the ordinal variables
### Aliases: validation.ord

### ** Examples

n.O<-3
prop.list<-list(c(0.3,0.6),c(0.25,0.5,0.75),c(0.1,0.2,0.8,0.9))
validation.ord(n.O,prop.list)

## Not run: 
##D n.O<-3
##D validation.ord(n.O)
##D 
##D n.O<-NULL
##D prop.list<-list(c(0.3,0.6),c(0.25,0.5,0.75),c(0.1,0.2,0.8,0.9))
##D validation.ord(prop.list=prop.list)
##D 
##D n.O<--3
##D prop.list<-list(c(0.3,0.6),c(0.25,0.5,0.75),c(0.1,0.2,0.8,0.9))
##D validation.ord(-3,prop.list)
##D 
##D n.O<--0
##D prop.list<-list(c(0.3,0.6),c(0.25,0.5,0.75),c(0.1,0.2,0.8,0.9))
##D validation.ord(n.O,prop.list)
##D 
##D n.O<-5
##D prop.list<-list(c(0.3,0.6),c(0.25,0.5,0.75),c(0.1,0.2,0.8,0.9))
##D validation.ord(n.O,prop.list)
##D 
##D n.O<-3
##D prop.list<-list(c(0.3,0.6),c(0.25,0.5,-0.75),c(0.1,0.2,0.8,1.5))
##D validation.ord(n.O,prop.list)
##D 
##D n.O<-3
##D prop.list<-list(0.3,c(0.3,0.4),c(0.4,0.2,0.3))
##D validation.ord(n.O,prop.list)
## End(Not run)



