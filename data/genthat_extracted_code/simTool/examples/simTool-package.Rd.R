library(simTool)


### Name: simTool-package
### Title: Conduct Simulation Studies with a Minimal Amount of Source Code
### Aliases: simTool-package simTool
### Keywords: computing parallel simulations,

### ** Examples


dg = expand_tibble(fun="rexp", n=c(10, 20), rate=1:2)
pg = expand_tibble(proc="summary")
eval_tibbles(dg, pg, replications=3)
eval_tibbles(dg, pg, replications=3, summary_fun = list(mean = mean))
eval_tibbles(dg, pg, replications=3, summary_fun = list(mean = mean, sd = sd))




