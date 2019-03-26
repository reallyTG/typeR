library(jmdem)


### Name: summary.jmdem.sim
### Title: Summarising JMDEM Simulations
### Aliases: summary.jmdem.sim print.summary.jmdem.sim

### ** Examples

## Example in jmdem.sim(...)
sim <- jmdem.sim(mformula = y ~ x, dformula = ~ z, beta.first = TRUE, 
                 mfamily = gaussian, dfamily = Gamma(link = "log"), 
                 x.str = list(type = "numeric", random.func = "rnorm", 
                              param = list(mean = 0, sd = 2)),
                 z.str = list(type = "factor", random.func = "runif", 
                              param = list(min = 0, max = 2)),
                 beta.true = c(1.5, 4), lambda.true = c(2.5, 3, -0.2), 
                 grad.func = TRUE, method = "BFGS", n = 50,
                 simnum = 10)
                  
## Summarise simulation
summary(sim, details = FALSE, other.call = TRUE)



