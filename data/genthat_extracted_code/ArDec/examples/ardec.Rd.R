library(ArDec)


### Name: ardec
### Title: Time series autoregressive decomposition
### Aliases: ardec
### Keywords: ts

### ** Examples


data(tempEng)
coef=ardec.lm(tempEng)$coefficients

# warning: running the next command can be time comsuming!

decomposition=ardec(tempEng,coef)

 


