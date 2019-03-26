library(COUNT)


### Name: smoking
### Title: smoking
### Aliases: smoking
### Keywords: datasets

### ** Examples

sbp    <- c(131,132,122,119,123,115)
male   <- c(1,1,1,0,0,0)
smoker <- c(1,1,0,0,1,0)
age    <- c(34,36,30,32,26,23)
summary(reg1 <- lm(sbp~ male+smoker+age))



