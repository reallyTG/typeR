library(verification)


### Name: leps
### Title: Linear Error in Probability Space (LEPS)
### Aliases: leps
### Keywords: file

### ** Examples

 obs <- rnorm(100, mean = 1, sd = sqrt(50))
 pred<-  rnorm(100, mean = 10, sd = sqrt(500))

 leps(obs, pred, main = "Sample Plot") 
## values approximated

OBS <- c(2.7, 2.9, 3.2, 3.3, 3.4, 3.4, 3.5, 3.8, 4, 4.2, 4.4, 4.4, 4.6,
5.8, 6.4)
PRED <- c(2.05, 3.6, 3.05, 4.5, 3.5, 3.0, 3.9, 3.2, 2.4, 5.3, 2.5, 2.8,
3.2, 2.8, 7.5)

a <- leps(OBS, PRED)
a



