library(exuber)


### Name: plot.radf
### Title: Plotting
### Aliases: plot.radf

### ** Examples

## No test: 
# Simulate bubble processes, compute t-stat and critical values and summarize
set.seed(4441)
dta <- cbind(sim_dgp1(n = 100), sim_dgp2(n = 100))
rfd <- radf(x = dta)
mc <- mc_cv(n = 100)
plot(x = rfd, y = mc)

# Plot the graphs in one plot
library(gridExtra)
p1 <- plot(x = rfd, mc)
do.call(grid.arrange, c(p1, ncol = 2))

#Plot in a single graph
plot(x = rfd, y = mc, plot_type = "single")
## End(No test)



