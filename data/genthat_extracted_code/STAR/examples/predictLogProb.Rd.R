library(STAR)


### Name: predictLogProb
### Title: Compute the Log Probability of a "New" Data Set Using a Fitted
###   Model Prediction
### Aliases: predictLogProb
### Keywords: models regression

### ** Examples

## Not run: 
##D data(e060824spont)
##D summary(e060824spont[["neuron 1"]])
##D reportHTML(e060824spont[["neuron 1"]],filename="e060824spont_1",otherST=e060824spont[c(2)],maxiter=100)
##D acf(diff(e060824spont[["neuron 1"]]),type="partial")
##D DFA <- subset(mkGLMdf(e060824spont,0.004,0,59),neuron==1)
##D DFA <- within(DFA,i1 <- isi(DFA,lag=1))
##D DFA <- DFA[complete.cases(DFA),]
##D m2u1 <- mkM2U(DFA,"lN.1",0,29,seed=20061001)
##D m2ui <- mkM2U(DFA,"i1",0,29,maxiter=200,seed=20061001)
##D DFA <- within(DFA,e1t <- m2u1(lN.1))
##D DFA <- within(DFA,i1t <- m2ui(i1))
##D with(DFA,plot(ecdf(e1t),pch="."))
##D with(DFA,plot(ecdf(i1t),pch="."))
##D DFAts <- as.ts(apply(DFA[,c("e1t","i1t")],2,qnorm))
##D plot(filter(DFAts,rep(1/125,125)))
##D system.time(GF1 <- gssanova(event ~ e1t+i1t, data=subset(DFA,time<=29),family="binomial",seed=20061001))
##D tt.1 <- GF1 %tt% subset(DFA,time>29)
##D tt.1.summary <- summary(tt.1)
##D tt.1.summary
##D plot(tt.1.summary,which=c(1,2,4,6))
##D renewalTestPlot(tt.1$ppspFct())
##D plot(GF1,nc=1,nr=2)
##D system.time(GF2 <- gssanova(event ~ e1t+i1t, data=subset(DFA,time>29),family="binomial",seed=20061001))
##D tt.2 <- GF2 %tt% subset(DFA,time<=29)
##D tt.2.summary <- summary(tt.2)
##D tt.2.summary
##D plot(tt.2.summary,which=c(1,2,4,6))
##D renewalTestPlot(tt.2$ppspFct())
##D plot(GF2,nc=1,nr=2)
##D system.time(GF3 <- gssanova(event ~ e1t*i1t, data=subset(DFA,time<=29),family="binomial",seed=20061001))
##D tt.3 <- GF3 %tt% subset(DFA,time>29)
##D (tt.3.summary <- summary(tt.3))
##D plot(tt.3.summary,which=c(1,2,4,6))
##D renewalTestPlot(tt.3$ppspFct())
##D plot(GF3,nc=1,nr=3)
##D system.time(GF4 <- gssanova(event ~ e1t*i1t, data=subset(DFA,time>29),family="binomial",seed=20061001))
##D tt.4 <- GF4 %tt% subset(DFA,time<=29)
##D (tt.4.summary <- summary(tt.4))
##D plot(tt.4.summary,which=c(1,2,4,6))
##D renewalTestPlot(tt.4$ppspFct())
##D plot(GF4,nc=1,nr=3)
##D ## Get the log probability of the data with the additive model
##D predictLogProb(GF1,newdata=subset(DFA,time>29))+predictLogProb(GF2,newdata=subset(DFA,time<=29))
##D ## Get the log probability of the data with the non-additive model
##D predictLogProb(GF3,newdata=subset(DFA,time>29))+predictLogProb(GF4,newdata=subset(DFA,time<=29))
##D ## The non additive model is the "best" so refit it to the whole data set
##D system.time(GF5 <- gssanova(event ~ e1t*i1t, data=DFA,family="binomial",seed=20061001))
##D plot(GF5,nr=3,nc=1)
## End(Not run)



