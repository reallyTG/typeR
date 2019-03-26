library(EpiModel)


### Name: truncate_sim
### Title: Truncate Simulation Time Series
### Aliases: truncate_sim

### ** Examples

param <- param.icm(inf.prob = 0.2, act.rate = 0.25)
init <- init.icm(s.num = 500, i.num = 1)
control <- control.icm(type = "SI", nsteps = 200, nsims = 1)
mod1 <- icm(param, init, control)
df <- as.data.frame(mod1)
print(df)
plot(mod1)
mod1$control$nsteps

mod2 <- truncate_sim(mod1, at = 150)
df2 <- as.data.frame(mod2)
print(df2)
plot(mod2)
mod2$control$nsteps




