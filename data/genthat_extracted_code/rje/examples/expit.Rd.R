library(rje)


### Name: expit
### Title: Expit and Logit.
### Aliases: expit logit
### Keywords: arith

### ** Examples

x = c(5, -2, 0.1)
y = expit(x)
logit(y)

# Beware large values!
logit(expit(100))



