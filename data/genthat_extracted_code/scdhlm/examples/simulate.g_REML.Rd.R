library(scdhlm)


### Name: simulate.g_REML
### Title: Simulate data from a fitted 'g_REML' object
### Aliases: simulate.g_REML

### ** Examples

data(Laski)
Laski_RML <- lme(fixed = outcome ~ treatment, 
                 random = ~ 1 | case, 
                 correlation = corAR1(0, ~ time | case), 
                 data = Laski)
Laski_g <- g_REML(Laski_RML, p_const = c(0,1), r_const = c(1,0,1))
simulate(Laski_g, nsim = 20)




