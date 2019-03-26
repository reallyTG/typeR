library(psychotools)


### Name: pcmodel
### Title: Partial Credit Model Fitting Function
### Aliases: pcmodel PCModel.fit print.pcmodel summary.pcmodel
###   print.summary.pcmodel coef.pcmodel bread.pcmodel estfun.pcmodel
###   logLik.pcmodel vcov.pcmodel
### Keywords: regression

### ** Examples

o <- options(digits = 4)

## Verbal aggression data
data("VerbalAggression", package = "psychotools")

## Partial credit model for the other-to-blame situations
pcm <- pcmodel(VerbalAggression$resp[, 1:12])
summary(pcm)

## visualizations
plot(pcm, type = "profile")
plot(pcm, type = "regions")
plot(pcm, type = "piplot")
plot(pcm, type = "curves")
plot(pcm, type = "information")

## Get data of situation 1 ('A bus fails to
## stop for me') and induce a null category in item 2.
pcd <- VerbalAggression$resp[, 1:6, drop = FALSE]
pcd[pcd[, 2] == 1, 2] <- NA

## fit pcm to these data, comparing downcoding and keeping strategy
pcm_va_keep  <- pcmodel(pcd, nullcats = "keep")
pcm_va_down  <- pcmodel(pcd, nullcats = "downcode")

plot(x = coef(pcm_va_keep), y = coef(pcm_va_down),
     xlab = "Threshold Parameters (Keeping)",
     ylab = "Threshold Parameters (Downcoding)",
     main = "Comparison of two null category strategies (I2 with null category)", 
     pch = rep(as.character(1:6), each = 2)[-3])
abline(b = 1, a = 0)

options(digits = o$digits)



