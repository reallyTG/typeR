library(meboot)


### Name: olsHALL.b
### Title: OLS regression model for consumption
### Aliases: olsHALL.b

### ** Examples

    data("USconsum")
    USconsum <- log(USconsum)

    # lm interface 
    lmcf1 <- lm(USconsum[-1,1] ~ USconsum[-51,1] + USconsum[-51,2])
    coefficients(lmcf1)
 
    # dynlm interface 
    library("dynlm")
    lmcf2 <- dynlm(consum ~ L(consum, 1) + L(dispinc, 1), data=USconsum)
    coefficients(lmcf2)

    # olsHALL.b
    olsHALL.b(y=USconsum[,1], x=USconsum[,2])
  


