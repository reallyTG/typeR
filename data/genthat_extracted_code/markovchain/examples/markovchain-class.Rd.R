library(markovchain)


### Name: markovchain-class
### Title: Class '"markovchain"'
### Aliases: markovchain-class *,markovchain,markovchain-method
###   *,markovchain,matrix-method *,markovchain,numeric-method
###   *,matrix,markovchain-method *,numeric,markovchain-method
###   [,markovchain,ANY,ANY,ANY-method ^,markovchain,numeric-method
###   ==,markovchain,markovchain-method !=,markovchain,markovchain-method
###   absorbingStates,markovchain-method
###   conditionalDistribution,markovchain-method
###   canonicForm,markovchain-method coerce,data.frame,markovchain-method
###   coerce,markovchain,data.frame-method coerce,table,markovchain-method
###   coerce,markovchain,igraph-method coerce,markovchain,matrix-method
###   coerce,markovchain,sparseMatrix-method
###   coerce,sparseMatrix,markovchain-method
###   coerce,matrix,markovchain-method coerce,msm,markovchain-method
###   coerce,msm.est,markovchain-method coerce,etm,markovchain-method
###   dim,markovchain-method initialize,markovchain-method
###   names,markovchain-method names<-,markovchain-method
###   plot,markovchain,missing-method predict,markovchain-method
###   print,markovchain-method show,markovchain-method
###   summary,markovchain-method sort,markovchain-method
###   t,markovchain-method
### Keywords: classes

### ** Examples

#show markovchain definition
showClass("markovchain")
#create a simple Markov chain
transMatr<-matrix(c(0.4,0.6,.3,.7),nrow=2,byrow=TRUE)
simpleMc<-new("markovchain", states=c("a","b"),
transitionMatrix=transMatr, 
name="simpleMc")
#power
simpleMc^4
#some methods
steadyStates(simpleMc)
absorbingStates(simpleMc)
simpleMc[2,1]
t(simpleMc)
is.irreducible(simpleMc)
#conditional distributions
conditionalDistribution(simpleMc, "b")
#example for predict method
sequence<-c("a", "b", "a", "a", "a", "a", "b", "a", "b", "a", "b", "a", "a", "b", "b", "b", "a")
mcFit<-markovchainFit(data=sequence)
predict(mcFit$estimate, newdata="b",n.ahead=3)
#direct conversion
myMc<-as(transMatr, "markovchain")

#example of summary
summary(simpleMc)
## Not run: plot(simpleMc)



