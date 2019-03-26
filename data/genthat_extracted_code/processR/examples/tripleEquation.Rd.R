library(processR)


### Name: tripleEquation
### Title: Make equation with triple interaction
### Aliases: tripleEquation

### ** Examples

X="negemot";M="ideology";Y="govact";suffix=0
cat(tripleEquation(X=X,M=M,Y=Y))
vars=list(name=list(c("sex","age")),site=list(c("a","c")))
vars=list(name=list(c("W","Z"),c("V","Q")),site=list(c("a","b","c"),c("a","b","c")))
X="negemot";Y="govact";suffix=0
moderator=list(name=c("W"),site=list(c("c")))
cat(tripleEquation(X=X,Y=Y,moderator=moderator))
covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list(c("M","Y"),"Y","Y"))
cat(tripleEquation(X=X,M=M,Y=Y,moderator=moderator,covar=covar))
cat(tripleEquation(X=X,M=M,Y=Y,moderator=moderator,covar=covar,mode=1))
cat(tripleEquation(X=X,M=M,Y=Y,vars=vars))
cat(tripleEquation(X=X,M=M,Y=Y,vars=vars,moderator=moderator,covar=covar))
cat(tripleEquation(X=X,M=M,Y=Y,vars=vars,mode=1))
cat(tripleEquation(X=X,M=M,Y=Y,vars=vars,covar=covar,mode=1))
X="negemot";Y="govact";suffix=0
vars=list(name=list(c("sex","age")),site=list(c("c")))
cat(tripleEquation(X=X,Y=Y,vars=vars))



