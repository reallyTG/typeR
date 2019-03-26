library(DstarM)


### Name: obsQuantiles
### Title: Calculate model fit
### Aliases: obsQuantiles

### ** Examples

tt = seq(0, 5, .01)
pars = c(.8, 2, .5, .5, .5, # condition 1
        .8, 3, .5, .5, .5,  # condition 2
        .8, 4, .5, .5, .5)  # condition 3
pdfND = dbeta(tt, 10, 30)
# simulate data
data = simData(n = 3e3, pars = pars, tt = tt, pdfND = pdfND)
probs = seq(0, 1, .01)
q = obsQuantiles(data, probs = probs)
matplot(probs, q, type = 'l', las = 1, bty = 'n')



