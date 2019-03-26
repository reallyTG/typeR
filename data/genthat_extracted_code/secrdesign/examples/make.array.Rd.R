library(secrdesign)


### Name: make.array
### Title: Re-cast Simulated Statistical Output as Array
### Aliases: make.array
### Keywords: manip

### ** Examples

## collect raw counts
scen1 <- make.scenarios(D = c(5,10), sigma = 25, g0 = 0.2)
traps1 <- make.grid()
tmp1 <- run.scenarios(nrepl = 50, trapset = traps1, scenarios = scen1,
    fit = FALSE)
make.array(tmp1)



