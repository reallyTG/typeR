library(prefmod)


### Name: plot.wmat
### Title: Method to plot worth or model parameters from LLBT or pattern
###   models
### Aliases: plot.wmat
### Keywords: models

### ** Examples

# fit only first three objects with SEX effect
m2 <- pattPC.fit(cemspc, nitems = 3, formel = ~SEX, elim = ~SEX, undec = TRUE)

# calculate and plot worth parameters
m2worth <- patt.worth(m2)
plot(m2worth)
plot(m2worth, pcol = "terrain")

# display of some plotsymbols (pch)
plot(0:25, rep(1, 26), pch = 0:25, cex = 1.5)
text(0:25, rep(0.95, 26), 0:25)

# usage of the "RColorBrewer" package
## Not run: 
##D library("RColorBrewer")
##D mypalette <- brewer.pal(3, "Set1")
##D plot(m2worth, pcol = mypalette)
## End(Not run)



