library(EngrExpt)


### Name: absorb
### Title: Oil absorption of silica
### Aliases: absorb
### Keywords: datasets

### ** Examples

str(absorb)
summary(absorb$absorb)
densityplot(~ absorb, absorb,
            xlab = "Average oil absorption of silica samples")
qqmath(~ absorb, absorb,
       ylab = "Average oil absorption of silica samples",
       xlab = "Standard normal quantiles", aspect = 1)



