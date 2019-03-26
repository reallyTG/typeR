library(emuR)


### Name: mu.colour
### Title: Function for specifying color, linetype, and line-widths in EMU
###   plotting functions.
### Aliases: mu.colour
### Keywords: utilities

### ** Examples


# examples will be given using the above functions
# b/w but with different linetypes
eplot(vowlax.fdat.5[,1:2], vowlax.l, col=FALSE, lty=TRUE)

# user-defined colors
eplot(vowlax.fdat.5[,1:2], vowlax.l, col=c("green", "blue", "red", "orange"))

# spectral plot, user-defined colors, the last one is dotted
# and with a line-thickness of 2
plot(vowlax.dft.5[1:20,], vowlax.l[1:20], 
col=c("green", "blue", "red", "orange"), 
fun=mean, lty=c(1, 1, 1, 2), lwd=c(1, 1, 1, 2))

# similar but using dplot()
dplot(vowlax.fdat[1:20,2], vowlax.l, 
col=c("green", "blue", "red", "orange"), 
lwd=c(1, 1, 1, 2), lty=c(1, 1, 1, 2))

# the default except plot everything with a dotted line and plotting symbol 4
dplot(vowlax.fdat[,2], vowlax.l, average=TRUE, lty=2, pch=4, type="b", xlim=c(40, 60))

# the default except plot everything with a dotted line and
# with double line thickness
eplot(vowlax.fdat.5[,1:2], vowlax.l, lty=2, lwd=2)




