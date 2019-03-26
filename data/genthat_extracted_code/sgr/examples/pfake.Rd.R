library(sgr)


### Name: pfake
### Title: Probability of faking.
### Aliases: pfake
### Keywords: distribution

### ** Examples

x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)

### fake good
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=4,Q=7,
                gam=c(GA[j],GA[j]),del=c(DE[j],DE[j]),p=c(.4,0)))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability") 
}

### fake bad
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=4,Q=7,
                gam=c(GA[j],GA[j]),del=c(DE[j],DE[j]),p=c(0,.4)))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability") 
}

### fake good and fake bad
P = c(.4,.4)
par(mfrow=c(2,4))
for (j in x) {
  y <- NULL
  for (i in x) {
    y <- c(y,pfake(x[i],h=x[j],Q=max(x),gam=c(GA[1],GA[1]),del=c(DE[1],DE[1]),p=P))
  }
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("h=",x[j],sep=""),ylim=c(0,1),
       ylab="Replacement probability") 
  print(sum(y,na.rm=TRUE)) 
}

### using the fake.model argument
x <- 1:5 
models <- c("uninformative","average","slight","extreme")
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=2,Q=max(x),
            fake.model=models[j],p=c(.45,0)))       # fake good
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste(models[j],"model"),ylim=c(0,1),
       ylab="Replacement probability") 
}

par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=4,Q=max(x),
            fake.model=models[j],p=c(0,.45)))       # fake bad
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste(models[j],"model"),ylim=c(0,1),
       ylab="Replacement probability") 
}




