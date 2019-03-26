library(robcbi)


### Name: Breslow
### Title: Breslow Data
### Aliases: Breslow
### Keywords: datasets

### ** Examples

library(robcbi)
data(Breslow)
y  <- Breslow$sumY
x1 <- Breslow$Age10
x2 <- Breslow$Base4
x3 <- rep(0,length(y))
x3[Breslow$Trt=="progabide"] <- 1



