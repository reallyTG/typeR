library(actuar)


### Name: GeneralizedBeta
### Title: The Generalized Beta Distribution
### Aliases: GeneralizedBeta dgenbeta pgenbeta qgenbeta rgenbeta mgenbeta
###   levgenbeta
### Keywords: distribution

### ** Examples

exp(dgenbeta(2, 2, 3, 4, 0.2, log = TRUE))
p <- (1:10)/10
pgenbeta(qgenbeta(p, 2, 3, 4, 0.2), 2, 3, 4, 0.2)
mgenbeta(2, 1, 2, 3, 0.25) - mgenbeta(1, 1, 2, 3, 0.25) ^ 2
levgenbeta(10, 1, 2, 3, 0.25, order = 2)



