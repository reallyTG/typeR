library(ade4)


### Name: foucart
### Title: K-tables Correspondence Analysis with the same rows and the same
###   columns
### Aliases: foucart plot.foucart print.foucart
### Keywords: multivariate

### ** Examples

data(bf88)
fou1 <- foucart(bf88, scann = FALSE, nf = 3)
fou1
plot(fou1)

data(meaudret)
l1 <- split(meaudret$spe, meaudret$design$season)
l1 <- lapply(l1, function(x) 
    {row.names(x) <- paste("Sit",1:5,sep="");x})
fou2 <- foucart(l1, scan = FALSE)

if(adegraphicsLoaded()) {
  kplot(fou2, row.plabels.cex = 2)
} else {
  kplot(fou2, clab.r = 2)
}



