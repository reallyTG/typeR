library(FactoMineR)


### Name: plot.CaGalt
### Title: Draw the Correspondence Analysis on Generalised Aggregated
###   Lexical Table (CaGalt) graphs
### Aliases: plot.CaGalt
### Keywords: multivariate

### ** Examples


## Not run: 
##D data(health)
##D res.cagalt<-CaGalt(Y=health[,1:115],X=health[,116:118],type="n")
##D plot(res.cagalt,choix="quali.var",conf.ellip=TRUE,axes=c(1,4))
##D 
##D ## Selection of some individuals,categories and frequencies
##D plot(res.cagalt,choix="freq",col.freq="darkgreen",cex=1.5,select="contrib 10") 
##D plot(res.cagalt,choix="ind",select="coord 10") 
##D plot(res.cagalt,choix="quali.var",select="cos2 0.5") 
## End(Not run)



