library(metaSEM)


### Name: Mak09
### Title: Eight studies from Mak et al. (2009)
### Aliases: Mak09
### Keywords: datasets

### ** Examples

## Random-effects meta-analysis
( meta1 <- summary(meta(y=yi, v=vi, data=Mak09, I2=c("I2q", "I2hm"))) )

## Convert the estimates back into odds ratio 
OR <- with(coef(meta1), exp(c(Estimate[1], lbound[1], ubound[1])))
names(OR) <- c("Estimate in OR", "lbound in OR", "ubound in OR")
OR
  
## Mixed-effects meta-analysis with mean age as a predictor
summary( meta(y=yi, v=vi, x=age.mean, data=Mak09) )



