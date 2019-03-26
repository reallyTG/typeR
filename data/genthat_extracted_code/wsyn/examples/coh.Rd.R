library(wsyn)


### Name: coh
### Title: Coherence
### Aliases: coh

### ** Examples

times<-1:100
dat1<-matrix(rnorm(1000),10,100)
dat2<-matrix(rnorm(1000),10,100)
dat1<-cleandat(dat1,times,1)$cdat
dat2<-cleandat(dat2,times,1)$cdat
norm<-"powall"
sigmethod<-"fast"
nrand<-10
res<-coh(dat1,dat2,times,norm,sigmethod,nrand)
#for real applications, use a much bigger nrand




