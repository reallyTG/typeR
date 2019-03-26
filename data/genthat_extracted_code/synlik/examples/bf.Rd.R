library(synlik)


### Name: bf
### Title: Nicholson's 1954 blowfly data
### Aliases: bf bf1 bf2 bf3

### ** Examples

  library(synlik)
  data(bf1)
  data(bf2)
  data(bf3)
  par(mfrow=c(3,1),mar=c(4,4,1,1))
  with(bf1,plot(day,pop,type="l"))
  with(bf1,points(day,pop,pch=20,cex=.8))
  abline(mean(bf1$pop),0,col=2); abline(median(bf1$pop),0,col=3);
  with(bf2,plot(day,pop,type="l"))
  with(bf2,points(day,pop,pch=20,cex=.8))
  abline(mean(bf2$pop),0,col=2); abline(median(bf2$pop),0,col=3);
  with(bf3,plot(day,pop,type="l"))
  with(bf3,points(day,pop,pch=20,cex=.8))
  abline(mean(bf3$pop),0,col=2); abline(median(bf3$pop),0,col=3);



