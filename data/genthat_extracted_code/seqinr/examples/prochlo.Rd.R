library(seqinr)


### Name: prochlo
### Title: Zscore on three strains of Prochlorococcus marinus
### Aliases: prochlo

### ** Examples

#
# Show the four YpY for the three ecotypes:
#
data(prochlo)
oneplot <- function(x){
  plot(density(prochlo$BX548174[, x]),
    ylim = c(0,0.4), xlim = c(-4,4), lty=3,
    main = paste(substr(x,1,1), "p", substr(x,2,2), " bias", sep = ""),
    xlab="",ylab="",las=1, type = "n")
  rect(-10,-1,-1.96,10, col = "yellow", border = "yellow")
  rect(1.96,-1,10,10, col = "yellow", border = "yellow")
  lines(density(prochlo$BX548174[, x]),lty=3)
  lines(density(prochlo$AE017126[, x]),lty=2)
  lines(density(prochlo$BX548175[, x]),lty=1)
  abline(v=c(-1.96,1.96),lty=5)
  box()
}
par(mfrow=c(2,2),mar=c(2,3,2,0.5) + 0.1)
oneplot("CT")
oneplot("TC")
oneplot("CC")
oneplot("TT")
#
# Show YpY biases with respect to light exposure
#
curdev <- getOption("device")
OK <- FALSE
devlist <- c("X11", "windows", "quartz") # interactive with width and height in inches
for(i in devlist){
  if(exists(i) && identical(get(i), curdev)){
    OK <- TRUE
    break
  }
}
if(OK){
  curdev(width = 18, height = 11)
  par(oma = c(0, 0, 3, 0), mfrow = c(1, 2), mar = c(5, 4, 0, 0), cex = 1.5)
  example(waterabs, ask = FALSE) #left figure

  par(mar = c(5, 0, 0, 2))
  plot(seq(-5, 3, by = 1), seq(0, 150, length = 9), col = "white", 
    ann = FALSE, axes = FALSE, xaxs = "i", yaxs = "i")
  axis(1, at = c(-1.96, 0, 1.96), labels = c(-1.96, 0, 1.96))
  lines(rep(-1.96, 2),c(0, 150),lty=2)
  lines(rep(1.96, 2), c(0, 150),lty=2)
  title(xlab = "zscore distribution", cex = 1.5, adj = 0.65)

  selcol <- c(6, 8, 14, 16)
  z5 <- prochlo$BX548174[, selcol]
  z120 <- prochlo$AE017126[, selcol]
  z135 <- prochlo$BX548175[, selcol]

  todo <- function(who, xx, col = "black", bottom, loupe){
  	dst <- density(who[, xx])
  	sel <- which(dst$x >= -3)
    	lines(dst$x[sel], dst$y[sel]*loupe + (bottom), col = col)
  }
  todo2 <- function(who, bottom, loupe){
    todo(who, "CC", "blue", bottom, loupe)
    todo(who, "CT", "red", bottom, loupe)
    todo(who, "TC", "green", bottom, loupe)
    todo(who, "TT", "black", bottom, loupe)
  }
  todo3 <- function(bottom, who, leg, loupe = 90){
    lines(c(-5,-3), c(150 - leg, bottom + 20))
    rect(-3,bottom,3,bottom+40)
    text(-2.6,bottom+38, paste(leg, "m"))
    todo2(who, bottom, loupe)
  }

  todo3(bottom = 110, who = z5, leg = 5)
  todo3(bottom = 50, who = z120, leg = 120)
  todo3(bottom = 5, who = z135, leg = 135)

  legend(-4.5,110,c('CpC','CpT','TpC','TpT'),lty=1,pt.cex=cex,
    col=c('blue','red','green','black'))

  mtext(expression(paste("Dinucleotide composition for three ", 
    italic("Prochlorococcus marinus")," ecotypes")), outer = TRUE, cex = 2, line = 1)
  }



