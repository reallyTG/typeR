library(semTools)


### Name: htmt
### Title: Assessing Discriminant Validity using Heterotrait-Monotrait
###   Ratio
### Aliases: htmt

### ** Examples


HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

dat <- HolzingerSwineford1939[, paste0("x", 1:9)]
htmt(HS.model, dat)




