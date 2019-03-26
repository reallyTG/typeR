library(spdep)


### Name: joincount.multi
### Title: BB, BW and Jtot join count statistic for k-coloured factors
### Aliases: joincount.multi print.jcmulti
### Keywords: spatial

### ** Examples

data(oldcol)
HICRIME <- cut(COL.OLD$CRIME, breaks=c(0,35,80), labels=c("low","high"))
names(HICRIME) <- rownames(COL.OLD)
joincount.multi(HICRIME, nb2listw(COL.nb, style="B"))
## Not run: 
##D data(hopkins, package="spData")
##D image(1:32, 1:32, hopkins[5:36,36:5], breaks=c(-0.5, 3.5, 20),
##D  col=c("white", "black"))
##D box()
##D hopkins.rook.nb <- cell2nb(32, 32, type="rook")
##D unlist(spweights.constants(nb2listw(hopkins.rook.nb, style="B")))
##D hopkins.queen.nb <- cell2nb(32, 32, type="queen")
##D hopkins.bishop.nb <- diffnb(hopkins.rook.nb, hopkins.queen.nb, verbose=FALSE)
##D hopkins4 <- hopkins[5:36,36:5]
##D hopkins4[which(hopkins4 > 3, arr.ind=TRUE)] <- 4
##D hopkins4.f <- factor(hopkins4)
##D table(hopkins4.f)
##D joincount.multi(hopkins4.f, nb2listw(hopkins.rook.nb, style="B"))
##D cat("replicates Upton & Fingleton table 3.4 (p. 166)\n")
##D joincount.multi(hopkins4.f, nb2listw(hopkins.bishop.nb, style="B"))
##D cat("replicates Upton & Fingleton table 3.6 (p. 168)\n")
##D joincount.multi(hopkins4.f, nb2listw(hopkins.queen.nb, style="B"))
##D cat("replicates Upton & Fingleton table 3.7 (p. 169)\n")
## End(Not run)



