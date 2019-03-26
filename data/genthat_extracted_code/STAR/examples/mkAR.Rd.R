library(STAR)


### Name: mkAR
### Title: Generate a Data Frame With Variables Suitable For an AR Like
###   Model
### Aliases: mkAR
### Keywords: models regression ts

### ** Examples

## Not run: 
##D require(STAR)
##D data(e060824spont)
##D DFA <- subset(mkGLMdf(e060824spont,0.004,0,59),neuron==1)
##D DFA <- mkAR(DFA, 0, 29, 5, maxiter=200)
##D head(DFA)
##D tail(DFA)
##D ar.fit <- gssanova(attr(DFA,"fmla"), data=DFA,family="binomial",seed=20061001)
##D plot(ar.fit %qp% "est")
##D plot(ar.fit %qp% "i1t")
##D plot(ar.fit %qp% "i2t")
##D plot(ar.fit %qp% "i3t")
##D plot(ar.fit %qp% "i4t")
##D plot(ar.fit %qp% "i5t")
## End(Not run)



