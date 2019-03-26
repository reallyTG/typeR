library(RSurveillance)


### Name: tp
### Title: True prevalence
### Aliases: tp
### Keywords: methods

### ** Examples

# examples for tp
x<- 20
n<- 120
se<- 0.9
sp<- 0.99
conf<- 0.95
tp(x, n, se, sp, "all")
tp(x, n, se, sp, "c-p")
tp(x, n, 0.95, 0.9, "c-p")



