library(fTrading)


### Name: RollingAnalysis
### Title: Rolling Analysis
### Aliases: RollingAnalysis rollFun rollVar
### Keywords: math

### ** Examples

## Rolling Analysis:
   x = (1:10)^2
   x
   trim =  c(TRUE, TRUE, FALSE, FALSE)
   na.rm = c(TRUE, FALSE, TRUE, FALSE)
   for (i in 1:4)
     rollFun(x, 5, trim[i], na.rm[i], FUN = min)
   for (i in 1:4)
     rollFun(x, 5, trim[i], na.rm[i], FUN = max)
   for (i in 1:4)
     rollVar(x, 5, trim[i], unbiased = TRUE, na.rm[i])
   for (i in 1:4)
     rollVar(x, 5, trim[i], unbiased = FALSE, na.rm[i])



