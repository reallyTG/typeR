library(StratSel)


### Name: StratSel-package
### Title: This package allows to estimate strategic selection models.
### Aliases: StratSel-package
### Keywords: Strategic models

### ** Examples

# replicate the example from Leemann (2014):
library(memisc)
data(war1800)
## Not run: 
##D out1 <- StratSel(Y ~ s_wt_re1 + revis1 | dem1 + mixed1 | balanc + 
##D  dem2 + mixed2, data=war1800, corr=TRUE)
## End(Not run)
out2 <- StratSel(Y ~ s_wt_re1 + revis1 | dem1 + mixed1 | balanc + 
 dem2 + mixed2, data=war1800, corr=FALSE)
setStratSelDefault()
## Not run: z <- mtable(out1,out2)
# toLatex(z) for a LaTeX output or just regular table:



