### R code from vignette source 'IEwSTARshort.Rnw'

###################################################
### code chunk number 1: cacheSweave set up (eval = FALSE)
###################################################
## setCacheDir("IEwSTARshort_dataCachedD")


###################################################
### code chunk number 2: start up things
###################################################
options(width=80,SweaveSyntax="SweaveSyntaxNoweb")
dir.create("report")
dir.create("figs")
set.seed(20061001)
Sys.setlocale(category="LC_MESSAGES",locale="C")


###################################################
### code chunk number 3: load STAR
###################################################
library(STAR)


###################################################
### code chunk number 4: load e060824spont
###################################################
data(e060824spont)


###################################################
### code chunk number 5: summary of neuron 1 from e060824spont
###################################################
summary(e060824spont[["neuron 1"]])


###################################################
### code chunk number 6: automatic analysis of e060824spont_1
###################################################
reportHTML(e060824spont[["neuron 1"]],filename="e060824spont_1",directory="report",otherST=e060824spont[c(2)],maxiter=100)


###################################################
### code chunk number 7: sub set spikeTrain (eval = FALSE)
###################################################
## e060824spont[[1]][10 <= e060824spont[[1]] & e060824spont[[1]] < 40]


###################################################
### code chunk number 8: prepare pacf of neuron 1 data set e060824
###################################################
pdf(file="figs/e060824spont_1_pacf.pdf",width=10,height=10)
par(cex=1.5)


###################################################
### code chunk number 9: pacf of neuron 1 data set e060824
###################################################
acf(diff(e060824spont[["neuron 1"]]),type="partial")


###################################################
### code chunk number 10: finish pacf of neuron 1 data set e060824
###################################################
dev.off()


###################################################
### code chunk number 11: create DFA
###################################################
DFA <- mkGLMdf(e060824spont[["neuron 1"]],0.004,0,59)


###################################################
### code chunk number 12: head of DFA
###################################################
head(DFA)


###################################################
### code chunk number 13: tail of DFA
###################################################
tail(DFA)


###################################################
### code chunk number 14: add i1 to DFA
###################################################
DFA <- within(DFA,i1 <- isi(DFA,lag=1))


###################################################
### code chunk number 15: head of modified DFA
###################################################
head(DFA)


###################################################
### code chunk number 16: get ride of NA in DFA
###################################################
DFA <- DFA[complete.cases(DFA),]


###################################################
### code chunk number 17: head of modified DFA again
###################################################
head(DFA)


###################################################
### code chunk number 18: start of burst
###################################################
burstIdx <- with(DFA,which(time == with(DFA,time[event==1])[which.min(diff(with(DFA,time[event==1])))])) 


###################################################
### code chunk number 19: check isi job
###################################################
DFA[burstIdx+(-1:6),]


###################################################
### code chunk number 20: prepare ecdf of lN.1 and i1 fig
###################################################
pdf(file="figs/ecdfIvar.pdf",width=12,height=8)
layout(matrix(1:2,nc=2))
par(cex=1.5)


###################################################
### code chunk number 21: ecdf of lN.1 and i1 fig
###################################################
with(DFA,plot(ecdf(lN.1),pch="."))
with(DFA,lines(range(lN.1),c(0,1),col=2,lty=2))
with(DFA,plot(ecdf(i1),pch="."))
with(DFA,lines(range(i1),c(0,1),col=2,lty=2))


###################################################
### code chunk number 22: finish ecdf of lN.1 and i1 fig
###################################################
dev.off()


###################################################
### code chunk number 23: map lN.1 and i1 two uniform
###################################################
m2u1 <- mkM2U(DFA,"lN.1",0,28.5)
m2ui <- mkM2U(DFA,"i1",0,28.5,maxiter=200)


###################################################
### code chunk number 24: add e1t and i1t to DFA
###################################################
DFA <- within(DFA,e1t <- m2u1(lN.1))
DFA <- within(DFA,i1t <- m2ui(i1))


###################################################
### code chunk number 25: prepare ecdf of lN.1 and i1 fig
###################################################
pdf(file="figs/ecdfIvarT.pdf",width=12,height=8)
layout(matrix(1:2,nc=2))
par(cex=1.5)


###################################################
### code chunk number 26: ecdf of e1t and i1t
###################################################
with(DFA,plot(ecdf(e1t),pch="."))
with(DFA,lines(range(e1t),c(0,1),col=2,lty=2))
with(DFA,plot(ecdf(i1t),pch="."))
with(DFA,lines(range(i1t),c(0,1),col=2,lty=2))


###################################################
### code chunk number 27: finish ecdf of e1t and i1t fig
###################################################
dev.off()


###################################################
### code chunk number 28: prepare e060824IvarEvol fig
###################################################
pdf(file="figs/e060824IvarEvol.pdf",width=12,height=8)
par(cex=2)


###################################################
### code chunk number 29: make time series object
###################################################
DFAts <- ts(with(DFA,cbind(event,qnorm(i1t))),
            start=DFA$time[1],
            delta=diff(DFA$time[1:2]))


###################################################
### code chunk number 30: plot DFAts after box-filtering it
###################################################
plot(filter(DFAts,rep(1/125,125)))


###################################################
### code chunk number 31: finish e060824IvarEvol fig
###################################################
dev.off()


###################################################
### code chunk number 32: GF1e e060824spont_1 display (eval = FALSE)
###################################################
## GF1e <- gssanova(event ~ e1t*i1t, data=subset(DFA,time<=29.5),
##                  family="binomial",seed=20061001)


###################################################
### code chunk number 33: GF1e e060824spont_1 do it
###################################################
GF1e.time <- system.time(GF1e <- gssanova(event ~ e1t*i1t, data=subset(DFA,time<=29.5),family="binomial",seed=20061001))


###################################################
### code chunk number 34: time transform GF1e
###################################################
tt.GF1e <- GF1e %tt% subset(DFA,time>29.5)


###################################################
### code chunk number 35: summary tt.GF1e
###################################################
tt.GF1e.summary <- summary(tt.GF1e)


###################################################
### code chunk number 36: print tt.GF1e.summary
###################################################
tt.GF1e.summary


###################################################
### code chunk number 37: last two in one (eval = FALSE)
###################################################
## (tt.GF1e.summary <- summary(tt.GF1e))


###################################################
### code chunk number 38: prepare fig e060824spont_1_GF1e_ogata
###################################################
pdf(file="figs/e060824spont_1_GF1e_ogata.pdf",width=10,height=10)
par(cex=2)


###################################################
### code chunk number 39: do fig e060824spont_1_GF1e_ogata
###################################################
plot(tt.GF1e.summary,which=c(1,2,4,6))


###################################################
### code chunk number 40: prepare fig e060824spont_1_GF1e_ogata
###################################################
dev.off()


###################################################
### code chunk number 41: GF1l e060824spont_1 do it
###################################################
GF1l.time <- system.time(GF1l <- gssanova(event ~ e1t*i1t, data=subset(DFA,time>29.5),
                                          family="binomial",seed=20061001))


###################################################
### code chunk number 42: GF1l e060824spont_1 display (eval = FALSE)
###################################################
## GF1l <- gssanova(event ~ e1t*i1t, data=subset(DFA,time>29.5),family="binomial",seed=20061001)


###################################################
### code chunk number 43: time transform GF1l
###################################################
tt.GF1l <- GF1l %tt% subset(DFA,time<=29.5)


###################################################
### code chunk number 44: summary tt.GF1e short (eval = FALSE)
###################################################
## (tt.GF1l.summary <- summary(tt.GF1l))


###################################################
### code chunk number 45: summary tt.GF1e
###################################################
tt.GF1l.summary <- summary(tt.GF1l)


###################################################
### code chunk number 46: print tt.GF1l.summary
###################################################
tt.GF1l.summary


###################################################
### code chunk number 47: prepare fig e060824spont_1_GF1l_ogata
###################################################
pdf(file="figs/e060824spont_1_GF1l_ogata.pdf",width=10,height=10)
par(cex=2)


###################################################
### code chunk number 48: do fig e060824spont_1_GF1l_ogata
###################################################
plot(tt.GF1l.summary,which=c(1,2,4,6))


###################################################
### code chunk number 49: finish fig e060824spont_1_GF1l_ogata
###################################################
dev.off()


###################################################
### code chunk number 50: GF2 sequential
###################################################
GF2e <- gssanova(event ~ e1t+i1t, data=subset(DFA,time<=29.5),
                 family="binomial",seed=19731004)
tt.GF2e <- GF2e %tt% subset(DFA,time>29.5)
(tt.GF2e.summary <- summary(tt.GF2e))
GF2l <- gssanova(event ~ e1t+i1t, data=subset(DFA,time>29.5),
                 family="binomial",seed=19731004)
tt.GF2l <- GF2l %tt% subset(DFA,time<=29.5)
(tt.GF2l.summary <- summary(tt.GF2l))


###################################################
### code chunk number 51: GF2 fit plot
###################################################
pdf(file="figs/e060824spont_1_GF2_ogata.pdf",width=10,height=15)
layout(matrix(1:6,nr=3))
par(cex=1.5,mar=c(4,3,3,2))
plot(tt.GF2e.summary,which=2)
plot(tt.GF2e.summary,which=4)
plot(tt.GF2e.summary,which=6)
plot(tt.GF2l.summary,which=2)
plot(tt.GF2l.summary,which=4)
plot(tt.GF2l.summary,which=6)
dev.off()


###################################################
### code chunk number 52: log prob of simpe model
###################################################
(GF2.logProb <- predictLogProb(GF2e,subset(DFA,time>29.5))+
 predictLogProb(GF2l,subset(DFA,time<=29.5)))


###################################################
### code chunk number 53: log prob of simpe model print
###################################################
GF2.logProb


###################################################
### code chunk number 54: log prob of complex model
###################################################
(GF1.logProb <- predictLogProb(GF1e,subset(DFA,time>29.5))+predictLogProb(GF1l,subset(DFA,time<=29.5)))


###################################################
### code chunk number 55: log prob of complex model print
###################################################
GF1.logProb


###################################################
### code chunk number 56: fit selected model to whole set (eval = FALSE)
###################################################
## GF1f.time <- system.time(GF1f <- gssanova(event~e1t*i1t, data=DFA, family="binomial", seed=20061001))


###################################################
### code chunk number 57: fit selected model to whole set show (eval = FALSE)
###################################################
## GF1f <- gssanova(event~e1t*i1t, data=DFA, family="binomial", seed=20061001)


###################################################
### code chunk number 58: prepare e060824spont_1_GF1_terms
###################################################
pdf(file="figs/e060824spont_1_GF1_terms.pdf",width=10,height=15)


###################################################
### code chunk number 59: plot GF1e
###################################################
plot(GF1e, nr=3, nc=1)


###################################################
### code chunk number 60: finish e060824spont_1_GF1_terms
###################################################
dev.off()


###################################################
### code chunk number 61: quickPredict on e1t
###################################################
term.e1t <- quickPredict(GF1e,"e1t")


###################################################
### code chunk number 62: quickPredict on i1t
###################################################
term.i1t <- GF1e %qp% "i1t"


###################################################
### code chunk number 63: get native scale for term.e1t and term.i1t
###################################################
term.e1 <- term.e1t
term.e1$xx <- attr(m2u1,"qFct")(term.e1$xx)
term.i1 <- term.i1t
term.i1$xx <- attr(m2ui,"qFct")(term.i1$xx)


###################################################
### code chunk number 64: prepare Fig e060824spont_1_GF1_terms2
###################################################
pdf(file="figs/e060824spont_1_GF1_terms2.pdf",width=10,height=10)
layout(matrix(1:4,nr=2,byrow=TRUE))
par(cex=1.5,mar=c(4,3,3,1))


###################################################
### code chunk number 65: do Fig e060824spont_1_GF1_terms2
###################################################
plot(term.e1t,
     xlab="Probability scale",
     ylab=expression(eta[1]),
     main="Elapsed time since last spike")
plot(term.e1,
     xlab="Time (s)",
     ylab=expression(eta[1]),
     panel.first=grid(col=1),
     main="Elapsed time since last spike")
plot(term.i1t,
     xlab="Probability scale",
     ylab=expression(eta[i1]),
     main="Last ISI")
plot(term.i1,
     xlab="Time (s)",
     ylab=expression(eta[i1]),
     main="Last ISI",
     panel.first=grid(col=1))


###################################################
### code chunk number 66: finish Fig e060824spont_1_GF1_terms2
###################################################
dev.off()


###################################################
### code chunk number 67: quickPredict on e1t:i1t
###################################################
term.e1ti1t <- GF1e %qp% "e1t:i1t"


###################################################
### code chunk number 68: changeScale on e1t:i1t
###################################################
term.e1i1 <- changeScale(term.e1ti1t, attr(m2u1,"qFct"), attr(m2ui,"qFct"))


###################################################
### code chunk number 69: prepare Fig e060824spont_1_GF1_terms3
###################################################
pdf(file="figs/e060824spont_1_GF1_terms3.pdf",width=10,height=10)
layout(matrix(1:4,nr=2,byrow=TRUE))
par(cex=1.5,mar=c(4,3,3,1))


###################################################
### code chunk number 70: do Fig e060824spont_1_GF1_terms3
###################################################
image(term.e1ti1t)
contour(term.e1ti1t,add=TRUE)
contour(term.e1ti1t,levels=seq(-2,2,0.5),labcex=1.5,col=2)
contour(term.e1ti1t,what="sd",levels=seq(-0.4,0.4,0.1),col=1,lty=2,add=TRUE)
persp(term.e1ti1t,theta=-10,phi=30)
persp(term.e1i1,theta=-25,phi=30,xlab="time since last (s)",ylab="last isi (s)",main="")


###################################################
### code chunk number 71: finish Fig e060824spont_1_GF1_terms3
###################################################
dev.off()


###################################################
### code chunk number 72: get fdelta on logit scale
###################################################
eta1.e <- predict(GF1e,newdata=subset(DFA,time > 29.5))
eta2.e <- predict(GF2e,newdata=subset(DFA,time > 29.5))


###################################################
### code chunk number 73: get lambda
###################################################
tigol <- function(x) exp(x)/(1+exp(x))
lambda1.e <- tigol(eta1.e)/0.004
lambda2.e <- tigol(eta2.e)/0.004


###################################################
### code chunk number 74: prepare Fig e060824spont_1_GF1and2
###################################################
pdf(file="figs/e060824spont_1_GF1and2.pdf",width=12,height=8)
par(cex=1.5)


###################################################
### code chunk number 75: do Fig e060824spont_1_GF1and2
###################################################
with(subset(DFA,time>29.5),
     plot(time,lambda1.e,
          xlim=c(30.5,32),type="l",col=2,
          xlab="Time (s)",
          ylab=expression(lambda~"(Hz)"),
          ylim=c(0,50),
          lwd=2)
     )
with(subset(DFA,time>29.5),
     lines(time,lambda2.e,xlim=c(30.5,32),
           col=4,lty=2,lwd=2)
     )
with(subset(DFA,time>29.5),
     rug(time[event==1],lwd=2)
     )
legend(30.5,45,
       c("with interaction","without interaction"),
       col=c(2,4),lty=c(1,2),lwd=c(2,2),bty="n")


###################################################
### code chunk number 76: finish Fig e060824spont_1_GF1and2
###################################################
dev.off()


###################################################
### code chunk number 77: sessionInfo
###################################################
sessionInfo()


###################################################
### code chunk number 78: reset options
###################################################
options(width=80)


