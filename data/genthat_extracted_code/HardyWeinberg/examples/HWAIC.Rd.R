library(HardyWeinberg)


### Name: HWAIC
### Title: Compute Akaike's Information Criterion (AIC) for HWP and EAF
###   models
### Aliases: HWAIC
### Keywords: misc

### ** Examples

males <- c(AA=11,AB=32,BB=13) 
females <- c(AA=14,AB=23,BB=11) 
stats <- HWAIC(males,females)
print(stats)



