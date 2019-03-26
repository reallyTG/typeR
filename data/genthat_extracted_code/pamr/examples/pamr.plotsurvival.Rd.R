library(pamr)


### Name: pamr.plotsurvival
### Title: A function to plots Kaplan-Meier curves stratified by a group
###   variable
### Aliases: pamr.plotsurvival

### ** Examples


gendata<-function(n=100, p=2000){
  tim <- 3*abs(rnorm(n))
  u<-runif(n,min(tim),max(tim))
  y<-pmin(tim,u)
   ic<-1*(tim<u)
m <- median(tim)
x<-matrix(rnorm(p*n),ncol=n)
  x[1:100, tim>m] <-  x[1:100, tim>m]+3
  return(list(x=x,y=y,ic=ic))
}

# generate training data; 2000 genes, 100 samples

junk<-gendata(n=100)
y<-junk$y
ic<-junk$ic
x<-junk$x
d <- list(x=x,survival.time=y, censoring.status=ic,
geneid=as.character(1:nrow(x)), genenames=paste("g",as.character(1:nrow(x)),sep=
""))

# train model
a3<- pamr.train(d, ngroup.survival=2)

#make class predictions

yhat <- pamr.predict(a3,d$x, threshold=1.0)

pamr.plotsurvival(yhat, d$survival.time, d$censoring.status)




