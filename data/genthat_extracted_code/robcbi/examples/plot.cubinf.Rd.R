library(robcbi)


### Name: plot.cubinf
### Title: Diagnostic plots for an object of class "cubinf"
### Aliases: plot.cubinf

### ** Examples

 library(robcbi)
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
 lVol <-log(Vol); lRate <- log(Rate)
 z.cub <- glm(Resp~lVol+lRate,family=binomial,method="cubinf", ufact=3.2)
 summary(z.cub)
## Not run: 
##D  plot(z.cub, smooth=TRUE, ask=TRUE)
## End(Not run)



