library(popEpi)


### Name: sir_ratio
### Title: Confidence intervals for the ratio of two SIRs/SMRs
### Aliases: sir_ratio

### ** Examples

## Ratio for sir-object and the same values given manually:


## create example dataset
dt1 <- data.frame(obs = rep(c(5,7), 10),
                  pyrs = rep(c(250,300,350,400), 5),
                  var = 1:20)
Ref <- data.frame(obs = rep(c(50,70,80,100), 5),
                 pyrs = rep(c(2500,3000,3500,4000), 5),
                 var = 1:20)
## sir using the function
s1 <- sir(coh.data = dt1, coh.obs = obs, coh.pyrs = pyrs, 
          ref.data = Ref, ref.obs = obs, ref.pyrs = pyrs,
          adjust = var)

## Ratio is simply 1:
sir_ratio(s1, c(120, 150))




