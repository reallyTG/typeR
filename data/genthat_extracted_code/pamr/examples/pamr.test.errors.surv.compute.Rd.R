library(pamr)


### Name: pamr.test.errors.surv.compute
### Title: A function giving a table of true versus predicted values, from
###   a nearest shrunken centroid fit from survival data.
### Aliases: pamr.test.errors.surv.compute

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

# generate test data
junkk<- gendata(n=500)

dd <- list(x=junkk$x, survival.time=junkk$y, censoring.status=junkk$ic)

# compute soft labels
proby <-  pamr.surv.to.class2(dd$survival.time, dd$censoring.status,
             n.class=a3$ngroup.survival)$prob


# make class predictions for test data
yhat <- pamr.predict(a3,dd$x, threshold=1.0)

# compute test errors

pamr.test.errors.surv.compute(proby, yhat)




