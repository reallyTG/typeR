library(POT)


### Name: plot.mcpot
### Title: Graphical Diagnostics: Markov Chains for All Exceedances.
### Aliases: plot.mcpot
### Keywords: hplot

### ** Examples

set.seed(123)
mc <- simmc(200, alpha = 0.5)
mc <- qgpd(mc, 0, 1, 0.25)
Mclog <- fitmcgpd(mc, 1)
par(mfrow=c(2,2))
rlMclog <- plot(Mclog)
rlMclog(T = 3)



