library(CompDist)


### Name: par.fit
### Title: par.fit
### Aliases: par.fit
### Keywords: Data fitting

### ** Examples
# Generate random data


par<-list()

distvec<-c("lnorm","gamma")

par[[1]]<-c(0,1,Inf)

par[[2]]<-c(1)

par[[3]]<-c(0,1)

par[[4]]<-c(1,1)


n<-1000

# non-continuous case

r1<-rcomp(n,distvec,par)

# continuous case

r2<-rcomp(n,distvec,par,borders=list(c(0.00001,10)),buffer=c(10e-5,0))


# Initial Guess



par<-list()

distvec<-c("lnorm","gamma")

par[[1]]<-c(0,1,Inf)

par[[2]]<-c(1)

par[[3]]<-c(0,0.5)

par[[4]]<-c(0.5,1)



# Fitting



# non-continuous case

estimate1<-par.fit(r1,distvec,par,optit=1)

# continuous case

estimate2<-par.fit(r2,distvec,par,borders=list(c(0.00001,10)),optit=1,buffer=c(10e-5,0),cont=TRUE)



x<-seq(0,30,0.01)

# non-continuous case

y1<-dcomp(x,distvec,estimate1$Parameter)

# continuous case

y2<-dcomp(x,distvec,estimate2$Parameter,borders=list(c(0.00001,10)),buffer=c(10e-5,0))



par(mfrow=c(1,2),oma=rep(0,4))

hist(r1,probability=TRUE,breaks=40,main="",xlab="Data",ylab="Fitted density")

lines(x,y1,col="red")

hist(r2,probability=TRUE,breaks=40,main="",xlab="Data",ylab="Fitted density")

lines(x,y2,col="red")



estimate1

estimate2


