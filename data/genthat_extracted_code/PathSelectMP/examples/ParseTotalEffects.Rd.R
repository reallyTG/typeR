library(PathSelectMP)


### Name: ParseTotalEffects
### Title: Parse Total, Direct, and Indirect Effects
### Aliases: ParseTotalEffects
### Keywords: Parse Total Effects Indirect Effects Direct Effects

### ** Examples

## Not run: 
##D 
##D Simulated=Simulate(n=1000,MissingYN=0,exampleNum=2)
##D #MissingYN is 1 for add missing data 0 is default which is don't add missing data
##D uu=Initialize(Simulated,WhichCat=c(1,1,1,1,1,0,1,0,0),
##D DataFileName="Example2",NameFile="Example2D",Directry=getwd())
##D AB=AllBackwardSelect(uu[[1]],Directry=getwd())
##D x=scan(paste(getwd(),"/","Example2D","/","Example2D_","26",".out",sep=""),what=character())
##D gg=ParseTotalEffects(x,"Example2D",Directry=getwd())
## End(Not run)



