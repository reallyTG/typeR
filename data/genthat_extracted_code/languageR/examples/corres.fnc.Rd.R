library(languageR)


### Name: corres.fnc
### Title: Correspondence Analysis
### Aliases: corres.fnc
### Keywords: multivariate

### ** Examples

 ## Not run: 
##D   data(oldFrench)
##D   oldFrench.ca = corres.fnc(oldFrench)
##D   oldFrench.ca
##D   summary(oldFrench.ca, head = TRUE)
##D   plot(oldFrench.ca)
##D 
##D   # more readable plot
##D   data(oldFrenchMeta)
##D   plot(oldFrench.ca, rlabels = oldFrenchMeta$Genre, 
##D   rcol = as.numeric(oldFrenchMeta$Genre), rcex = 0.5, 
##D   extreme = 0.1, ccol = "blue")
##D 
##D   # create subset of proze texts
##D 
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
##D   # and add supplementary data for texts with unknown date of composition
##D   proseSup = oldFrench[oldFrenchMeta$Genre == "prose" & 
##D           is.na(oldFrenchMeta$Year),]
##D   corsup.fnc(prose.ca, bycol = FALSE, supp = proseSup, font = 2, 
##D   cex = 0.8, labels = substr(rownames(proseSup), 1, 4)) 
##D  
## End(Not run)



