library(ieeeround)


### Name: ieeeround
### Title: The ieeeround package
### Aliases: ieeeround-package fegetround fesetround FE.DOWNWARD FE.UPWARD
###   FE.TOWARDZERO FE.TONEAREST
### Keywords: misc programming

### ** Examples

fesetround(FE.UPWARD)
x <- 1/5
fesetround(FE.DOWNWARD)
y <- 1/5
print(x-y > 0)
fesetround(FE.TONEAREST)



