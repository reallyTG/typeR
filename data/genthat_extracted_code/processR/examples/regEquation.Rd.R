library(processR)


### Name: regEquation
### Title: Make regression equation
### Aliases: regEquation

### ** Examples

X="X";M=NULL;Y="Y"; moderator=list(name="W",site=list("c"))
regEquation(X,M,Y,moderator)
M=c("M1","M2")
regEquation(X,M,Y,moderator,secondIndirect=TRUE)
covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list(c("M1","Y"),"Y","Y"))
regEquation(X,M,Y,moderator,covar=covar)



