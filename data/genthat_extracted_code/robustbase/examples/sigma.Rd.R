library(robustbase)


### Name: sigma
### Title: Extract 'Sigma' - Standard Deviation of Errors for Robust Models
### Aliases: sigma sigma.lmrob
### Keywords: models

### ** Examples

      m.cl <-   lm (Y ~ ., data=coleman)
if(getRversion() >= "3.3.0")  sigma(m.cl)  else  summary(m.cl)$sigma
sigma( m1  <- lmrob(Y ~ ., data=coleman) )
sigma( m2  <- lmrob(Y ~ ., data=coleman, setting = "KS2014") )



