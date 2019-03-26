library(FSAdata)


### Name: Casselman1990
### Title: Instantaneous growth rates for two calcified ageing structures.
### Aliases: Casselman1990
### Keywords: datasets

### ** Examples

data(Casselman1990)

# recreation of Casselman's (199) Figure 8.
p <- c(19,17,15); clr <- c("black","red","blue"); l <- 1
with(Casselman1990,
     matplot(day,cbind(body,cleithrum,scale),type="b",lwd=2,pch=p,col=clr,lty=l,
             ylab="Instantaneous Growth Rate",xaxt="n",xlab="")
)
axis(1,at=c(0,31,60,91,121,152,182,213,243,274,304,335,365),tick=TRUE,labels=FALSE)
axis(1,at=c(15,46,76,107,137,168,198,229,260,291,321,352),tick=FALSE,
     labels=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
legend("topleft",legend=c("Body","Cleithrum","Scale"),pch=p,col=clr,lty=l,lwd=2)




