library(MSEtool)


### Name: DD_TMB
### Title: Delay - Difference Stock Assessment in TMB
### Aliases: DD_TMB DD_SS

### ** Examples

## No test: 
#### Observation-error delay difference model
res <- DD_TMB(Data = DLMtool::Red_snapper)

# Provide starting values
start <- list(R0 = 1, h = 0.95)
res <- DD_TMB(Data = DLMtool::Red_snapper, start = start)

summary(res@SD) # Parameter estimates

### State-space version
### Set recruitment variability SD = 0.3 (since fix_tau = TRUE)
res <- DD_SS(Data = Red_snapper, start = list(tau = 0.3))
## End(No test)



