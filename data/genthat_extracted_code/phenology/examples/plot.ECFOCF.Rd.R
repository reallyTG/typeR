library(phenology)


### Name: plot.ECFOCF
### Title: Plot a result of clutch frequency fit.
### Aliases: plot.ECFOCF

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D data(MarineTurtles_2002)
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002)
##D o_mu1p2_NB <- fitCF(x = c(mu = 4.6426989650675701, 
##D                          sd = 75.828239144717074, 
##D                          p1 = 0.62036295627161053,
##D                          p2 = -2.3923021862881511, 
##D                          OTN = 0.33107456308054345),
##D                  data=ECFOCF_2002)
##D                  
##D par(mar=c(4, 4, 1, 1)+0.4)
##D plot(o_mu1p2_NB, result="data", category=NA, 
##D      bty="n", las=1, cex.points=3, cex.axis = 0.8)
##D plot(o_mu1p2_NB,result="data", category=NA, 
##D      bty="n", las=1, cex.points=3, pch=NA, 
##D      col.labels = "red", show.labels=TRUE, cex.0=0.2, 
##D      show.0 = TRUE, col.0="blue", pch.0=4)
##D plot(o_mu1p2_NB, result="dataOCF", category=NA, 
##D      bty="n", las=1)
##D plot(o_mu1p2_NB, result="dataECF", category=NA, 
##D      bty="n", las=1)
##D      
##D plot(o_mu1p2_NB, result="CF", bty="n", las=1)
##D 
##D plot(o_mu1p2_NB, result="OCF", category=1, bty="n", las=1)
##D plot(o_mu1p2_NB, result="OCF", category=2, bty="n", las=1)
##D 
##D plot(o_mu1p2_NB, result="ECFOCF", bty="n", las=1)
##D 
##D plot(o_mu1p2_NB, result="ECFOCF0", bty="n", las=1)
##D plot(o_mu1p2_NB, result="ECFOCF0", category=1, bty="n", las=1)
##D plot(o_mu1p2_NB, result="ECFOCF0", category=2, bty="n", las=1)
##D 
##D plot(o_mu1p2_NB, result="Prob", category=c(1, 2), bty="n", las=1)
##D plot(o_mu1p2_NB, result="Prob", category=c(2, 1), bty="n", las=1)
##D 
## End(Not run)



