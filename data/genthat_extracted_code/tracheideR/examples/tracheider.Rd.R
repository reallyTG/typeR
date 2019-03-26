library(tracheideR)


### Name: tracheider
### Title: Compute standardized tracheidograms
### Aliases: tracheider

### ** Examples


## Not run:
y2010 <- getTrac(tch$'y2010', scale=0.169)
y2013 <- getTrac(tch$'y2013', scale=0.169)

## nCells
y2010n <- tracheider(y2010, method = "nCells")
y2013n <- tracheider(y2013, method = "nCells")
plot(rowMeans(as.data.frame(y2010n$LD)), type="l", xlim=c(0,86),
     ylim=c(0,60), yaxs="i", xaxs="i", xlab="Number of tracheid",
     ylab=expression(paste("LD (", mu,"m)")), col=2, lwd=2)
lines(rowMeans(as.data.frame(y2013n$LD)), col="blue", lwd=2)
legend("topright",lty=1,lwd=2,col = c(2,4), legend=c("2010 ","2013 "),
        text.col = c(2,4), box.col = "#00000000", bg="#00000000")

## k = 53
TCH <- lapply(tch, getTrac, scale=0.169)
TCHn53 <- lapply(TCH, tracheider,method = "kCells", k=53)

plot(rowMeans(as.data.frame(TCHn53$'y2010'$LD)), type="l",
     xlab="Number of tracheid", ylab=expression(paste("LD (", mu,"m)")),
     xlim=c(0,54), ylim=c(0,60), col=2, lwd=2, yaxs="i", xaxs="i")
lines(rowMeans(as.data.frame(TCHn53$'y2013'$LD)), col="blue", lwd=2)
legend("topright",lty=1,lwd=2,col = c(2,4),legend=c("2010 ","2013 "),
     text.col = c(2,4), box.col = "#00000000", bg="#00000000")

## Relative position
TCH <- lapply(tch, getTrac, scale=0.169)
TCHrelPos <- lapply(TCH, tracheider, method ="relPos")
plot(rowMeans(as.data.frame(TCHrelPos$'y2010'$LD)),
     type="l", xlim=c(0,101), ylim=c(0,60), col=2, lwd=2,
     xlab="Number of tracheid", ylab=expression(paste("LD (", mu,"m)")),
     yaxs="i", xaxs="i")
lines(rowMeans(as.data.frame(TCHrelPos$'y2013'$LD)),
      col="blue", lwd=2)
legend("topright",lty=1,lwd=2,col = c(2,4), legend=c("2010 ","2013 "),
       text.col = c(2,4), box.col = "#00000000", bg="#00000000")
## End(not run)



