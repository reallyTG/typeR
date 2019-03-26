library(LIM)


### Name: Xranges
### Title: Generates ranges of the unknowns of a linear inverse problem
### Aliases: Xranges
### Keywords: optimize utilities

### ** Examples

# ranges
xr   <- Xranges(LIMRigaAutumn)
xlim <- range(xr)

# parsimonious
pars <- Lsei(LIMRigaAutumn)$X

# plot
dotchart(x = pars, labels = rownames(xr), xlim = xlim,  
         main = "Riga Autumn ",
         sub = "ranges and parsimonious solution", pch = 16)
cc <- 1:nrow(xr)
segments(xr[ ,1], cc, xr[ ,2], cc)


