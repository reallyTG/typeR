library(metamisc)


### Name: plot.mm_perf
### Title: Forest Plots
### Aliases: plot.mm_perf
### Keywords: forest

### ** Examples

data(EuroSCORE)

# Calculate the c-statistic and its standard error
est1 <- ccalc(cstat = c.index, cstat.se = se.c.index, cstat.cilb = c.index.95CIl, 
              cstat.ciub = c.index.95CIu, N = n, O = n.events, data = EuroSCORE, slab = Study)
plot(est1)

# Calculate the total O:E ratio and its standard error
est2 <- oecalc(O = n.events, E = e.events, N = n, data = EuroSCORE, slab = Study)
plot(est2)




