library(MANOVA.RM)


### Name: MANOVA.wide
### Title: Tests for Multivariate Data in Semi-Parametric Factorial Designs
### Aliases: MANOVA.wide

### ** Examples

#Example on producing plastic film from Krzanowski (1998, p. 381), see \code{manova.summary}
tear <- c(6.5, 6.2, 5.8, 6.5, 6.5, 6.9, 7.2, 6.9, 6.1, 6.3,
          6.7, 6.6, 7.2, 7.1, 6.8, 7.1, 7.0, 7.2, 7.5, 7.6)
gloss <- c(9.5, 9.9, 9.6, 9.6, 9.2, 9.1, 10.0, 9.9, 9.5, 9.4,
           9.1, 9.3, 8.3, 8.4, 8.5, 9.2, 8.8, 9.7, 10.1, 9.2)
opacity <- c(4.4, 6.4, 3.0, 4.1, 0.8, 5.7, 2.0, 3.9, 1.9, 5.7,
             2.8, 4.1, 3.8, 1.6, 3.4, 8.4, 5.2, 6.9, 2.7, 1.9)
rate     <- gl(2,10, labels = c("Low", "High"))
additive <- gl(2, 5, length = 20, labels = c("Low", "High"))
example <- data.frame(tear, gloss, opacity, rate, additive)
fit <- MANOVA.wide(cbind(tear, gloss, opacity) ~ rate * additive, 
data = example, iter = 100, CPU = 1)
summary(fit)




