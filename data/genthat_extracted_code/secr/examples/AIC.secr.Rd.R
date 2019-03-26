library(secr)


### Name: AIC.secr
### Title: Compare SECR Models
### Aliases: AIC.secr logLik.secr AIC.secrlist secrlist [.secrlist
### Keywords: models

### ** Examples

## Compare two models fitted previously
## secrdemo.0 is a null model
## secrdemo.b has a learned trap response

AIC(secrdemo.0, secrdemo.b)

## Form secrlist and pass to AIC.secr
temp <- secrlist(null = secrdemo.0, learnedresponse = secrdemo.b)
AIC(temp)




