library(lomb)


### Name: plot.lsp
### Title: Plot Lomb-Scargle Periodogram
### Aliases: plot.lsp
### Keywords: ts

### ** Examples

data(ibex)
ibex.spec <- lsp(ibex[,2:3],type='period',from=12,to=36,ofac=10, plot=FALSE)
op <- par(pch=16)
plot.lsp(ibex.spec, main="Periodogram of daily rhythms of Tb in Capra ibex",
    cex.lab=1.3,log="", type="b",level=FALSE,xaxt="n")
axis(side=1,at=seq(12,36,by=6))
par(op)



