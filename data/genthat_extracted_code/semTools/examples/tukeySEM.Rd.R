library(semTools)


### Name: tukeySEM
### Title: Tukey's WSD post-hoc test of means for unequal variance and
###   sample size
### Aliases: tukeySEM

### ** Examples


## For a case where three groups have been compared:
## Group 1: mean = 3.91, var = 0.46, n = 246
## Group 2: mean = 3.96, var = 0.62, n = 465
## Group 3: mean = 2.94, var = 1.07, n = 64

## compare group 1 and group 2
tukeySEM(3.91, 3.96, 0.46, 0.62, 246, 425, 3)

## compare group 1 and group 3
tukeySEM(3.91, 2.94, 0.46, 1.07, 246, 64, 3)

## compare group 2 and group 3
tukeySEM(3.96, 2.94, 0.62, 1.07, 465, 64, 3)




