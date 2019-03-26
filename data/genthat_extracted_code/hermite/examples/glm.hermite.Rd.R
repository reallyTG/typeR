library(hermite)


### Name: glm.hermite
### Title: Maximum likelihood estimation and Hermite regression
### Aliases: glm.hermite
### Keywords: hermite

### ** Examples

data <- c(rep(0,122), rep(1,40), rep(2,14), rep(3,16), rep(4,6), rep(5,2))
mle1 <- glm.hermite(data~1, link="log", start=NULL, m=3)
mle1



