library(multcomp)


### Name: parm
### Title: Model Parameters
### Aliases: parm
### Keywords: misc

### ** Examples


## example from
## Bretz, Hothorn, and Westfall (2002). 
## On multiple comparisons in R. R News, 2(3):14-17.

beta <- c(V1 = 14.8, V2 = 12.6667, V3 = 7.3333, V4 = 13.1333)
Sigma <- 6.7099 * (diag(1 / c(20, 3, 3, 15)))
confint(glht(model = parm(beta, Sigma, 37),
             linfct = c("V2 - V1 >= 0", 
                        "V3 - V1 >= 0", 
                        "V4 - V1 >= 0")), 
        level = 0.9)




