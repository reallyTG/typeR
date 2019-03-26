library(STAR)


### Name: plot.ssanova
### Title: A Plot Method for ssanova and ssanvoa0 Objects Tailored to Their
###   Use in STAR
### Aliases: plot.ssanova plot.ssanova0
### Keywords: models regression

### ** Examples

## Not run: 
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
##D m1.fit <- gssanova(event~e1t*i1t, data=subset(DFA,time>29), family="binomial", seed=20061001)
##D inter.pred <- m1.fit %qp% "e1t:i1t"
##D contour(inter.pred,what="mean",nlevels=10,col=2,lwd=2)
##D contour(inter.pred,what="sd",nlevels=5,col=1,lwd=1,lty=2,add=TRUE)
##D inter.predN <- changeScale(inter.pred,attr(m2u1,"qFct"),attr(m2ui,"qFct"))
##D contour(inter.predN,what="mean",nlevels=5,col=2,lwd=1)
##D contour(inter.predN,what="sd",nlevels=3,col=1,lwd=1,lty=2,add=TRUE)
##D plot(m1.fit,nr=3,nc=1)
## End(Not run)



