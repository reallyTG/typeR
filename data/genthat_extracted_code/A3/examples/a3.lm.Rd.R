library(A3)


### Name: a3.lm
### Title: A3 for Linear Regressions
### Aliases: a3.lm

### ** Examples

## No test: 
 ## Standard linear regression results:

 summary(lm(rating ~ ., attitude))

 ## A3 linear regression results:

 # In practice, p.acc should be <= 0.01 in order
 # to obtain fine grained p values.

 a3.lm(rating ~ ., attitude, p.acc = 0.1)

 # This is equivalent both to:

 a3(rating ~ ., attitude, glm, model.args = list(family = gaussian), p.acc = 0.1)

 # and also to:

 a3(rating ~ ., attitude, lm, p.acc = 0.1)
 
## End(No test)



