library(WRS2)


### Name: pbcor
### Title: Robust correlation coefficients.
### Aliases: pbcor wincor winall pball print.pbcor
### Keywords: models

### ** Examples

x1 <- subset(hangover, subset = (group == "control" & time == 1))$symptoms
x2 <- subset(hangover, subset = (group == "control" & time == 2))$symptoms

pbcor(x1, x2)
pbcor(x1, x2, beta = 0.1)

wincor(x1, x2)
wincor(x1, x2, tr = 0.1)

require(reshape)
hanglong <- subset(hangover, subset = group == "control")
hangwide <- cast(hanglong, id ~ time, value = "symptoms")[,-1]

pball(hangwide)
winall(hangwide)



