library(blmeco)


### Name: ocv
### Title: Ordinary cross validation score
### Aliases: ocv
### Keywords: model

### ** Examples

data(pondfrog1)
mod1 <- lm(log(frog+1)~ph, data=pondfrog1)
mod2 <- lm(log(frog+1)~waterdepth, data=pondfrog1)
ocv(mod1)
ocv(mod2)



