library(ssfa)


### Name: eff.ssfa
### Title: SSFA efficiency
### Aliases: eff.ssfa

### ** Examples

library(ssfa) 
data(SSFA_example_data)
data(Italian_W)
ssfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, data_w=Italian_W, 
             form = "production", par_rho=TRUE)
eff <- eff.ssfa(ssfa)



