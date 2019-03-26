library(STAR)


### Name: mkM2U
### Title: Makes a Smooth Function Mapping a Data Frame Variable Onto a
###   Variable Uniform on Its Definition Domain
### Aliases: mkM2U
### Keywords: models regression

### ** Examples

## Not run: 
##D require(STAR)
##D data(e060824spont)
##D DFA <- subset(mkGLMdf(e060824spont,0.004,0,59),neuron==1)
##D DFA <- within(DFA,i1 <- isi(DFA,lag=1))
##D DFA <- DFA[complete.cases(DFA),]
##D m2u1 <- mkM2U(DFA,"lN.1",0,29)
##D m2ui <- mkM2U(DFA,"i1",0,29,maxiter=200)
##D DFA <- within(DFA,e1t <- m2u1(lN.1))
##D DFA <- within(DFA,i1t <- m2ui(i1))
##D with(DFA,plot(ecdf(e1t[time>29]),pch="."))
##D abline(a=0,b=1,col=2,lty=2)
##D with(DFA,plot(ecdf(i1t[time>29]),pch="."))
##D abline(a=0,b=1,col=2,lty=2)
## End(Not run)



