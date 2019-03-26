library(pscl)


### Name: ca2006
### Title: California Congressional Districts in 2006
### Aliases: ca2006
### Keywords: datasets

### ** Examples

data(ca2006)

## 2006 CA congressional vote against 2004 pvote
y <- ca2006$D/(ca2006$D+ca2006$R)
x <- ca2006$Kerry2004/(ca2006$Kerry2004+ca2006$Bush2004)

pch <- rep(19,length(y))
pch[ca2006$open] <- 1
col <- rep("black",length(y))
col[11] <- "red"    ## Pembo (R) loses to McNerney (D)
plot(y~x,pch=pch,
     col=col,
     xlim=range(x,y,na.rm=TRUE),
     ylim=range(x,y,na.rm=TRUE),
     xlab="Kerry Two-Party Vote, 2004",
     ylab="Democratic Two-Party Vote Share, 2006")
abline(0,1)
abline(h=.5,lty=2)
abline(v=.5,lty=2)
legend(x="topleft",
       bty="n",
       col=c("red","black","black"),
       pch=c(19,19,1),
       legend=c("Seat Changing Hands",
         "Seat Retained by Incumbent Party",
         "Open Seat (no incumbent running)")
       )



