library(prefmod)


### Name: prefmod-defunct
### Title: Defunct Functions in Package 'prefmod'
### Aliases: prefmod-defunct plotworth

### ** Examples

## Not run: 
##D ###################
##D ### plotworth() ###
##D ###################
##D 
##D # fit only first three objects with SEX effect
##D m2 <- pattPC.fit(cemspc, nitems = 3, formel = ~SEX, elim = ~SEX, undec = TRUE)
##D 
##D # calculate and plot worth parameters
##D m2worth <- patt.worth(m2)
##D plot.wmat(m2worth)
##D plot.wmat(m2worth, pcol = "terrain")
##D 
##D # display of some plotsymbols (pch)
##D plot(0:25, rep(1, 26), pch = 0:25, cex = 1.5)
##D text(0:25, rep(0.95, 26), 0:25)
##D 
##D # usage of the "RColorBrewer" package
##D library("RColorBrewer")
##D mypalette <- brewer.pal(3, "Set1")
##D plot.wmat(m2worth, pcol = mypalette)
## End(Not run)



