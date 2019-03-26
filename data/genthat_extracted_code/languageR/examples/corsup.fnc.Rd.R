library(languageR)


### Name: corsup.fnc
### Title: Supplementary rows or columns in correspondence analysis
### Aliases: corsup.fnc
### Keywords: multivariate

### ** Examples

 ## Not run: 
##D   data(oldFrench)
##D   data(oldFrenchMeta)
##D   prose = oldFrench[oldFrenchMeta$Genre=="prose" & 
##D           !is.na(oldFrenchMeta$Year),]
##D   proseinfo = oldFrenchMeta[oldFrenchMeta$Genre=="prose" & 
##D           !is.na(oldFrenchMeta$Year),]
##D   proseinfo$Period = as.factor(proseinfo$Year <= 1250)
##D 
##D   prose.ca = corres.fnc(prose)
##D   plot(prose.ca, addcol = FALSE, 
##D   rcol = as.numeric(proseinfo$Period) + 1, 
##D   rlabels = proseinfo$Year, rcex = 0.7)
##D 
##D   proseSup = oldFrench[oldFrenchMeta$Genre == "prose" & 
##D           is.na(oldFrenchMeta$Year),]
##D   corsup.fnc(prose.ca, bycol = FALSE, supp = proseSup, font = 2, 
##D   cex = 0.8, labels = substr(rownames(proseSup), 1, 4)) 
##D  
## End(Not run)



