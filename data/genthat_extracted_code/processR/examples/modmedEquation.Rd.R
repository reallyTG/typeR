library(processR)


### Name: modmedEquation
### Title: Make moderated mediation equation
### Aliases: modmedEquation

### ** Examples

X="X";Y="Y"
moderator=list(name=c("Z"),site=list(c("a","c")))
cat(modmedEquation(X=X,Y=Y,moderator=moderator,range=TRUE))
X="X";M="M";Y="Y"
cat(modmedEquation(X=X,M=M,Y=Y,range=TRUE))
X="X";M="M";Y="Y"
moderator=list(name=c("Z"),site=list(c("a","c")))
cat(modmedEquation(X=X,M=M,Y=Y,moderator=moderator,range=TRUE))
X="X";M="M";Y="Y";labels=NULL;range=FALSE
moderator=list(name=c("X"),site=list(c("b")))
cat(modmedEquation(X=X,M=M,Y=Y,moderator=moderator,range=FALSE))
X="X";Y="Y"
moderator=list(name=c("Z"),site=list(c("c")))
cat(modmedEquation(X=X,Y=Y,moderator=moderator,range=FALSE))
covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list(c("M","Y"),"Y","Y"))
cat(modmedEquation(X=X,M="M",Y=Y,moderator=moderator,range=FALSE,covar=covar))



