library(StratSel)


### Name: StratSel
### Title: Fitting Strategic Selection Models
### Aliases: StratSel
### Keywords: Strategic Selection Estimator

### ** Examples

# replicate the example from Leemann (2014):
data(war1800)
## Not run: 
##D out1 <- StratSel(Y ~ s_wt_re1 + revis1 | dem1 + mixed1 | balanc
##D  + dem2 + mixed2, data=war1800, corr=TRUE)
## End(Not run)
out2 <- StratSel(Y ~ s_wt_re1 + revis1 | dem1 + mixed1 | balanc
 + dem2 + mixed2, data=war1800, corr=FALSE)



