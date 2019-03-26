library(ggiraphExtra)


### Name: ggPredict
### Title: Visualize predictions from the multiple regression models.
### Aliases: ggPredict

### ** Examples

require(moonBook)
require(ggplot2)
require(ggiraph)
require(plyr)
fit=lm(NTAV~age*weight,data=radial)
fit=lm(NTAV~age*weight*DM,data=radial)
fit=lm(NTAV~age+DM,data=radial)
ggPredict(fit,interactive=TRUE)
require(TH.data)
fit=glm(cens~pnodes*horTh,data=GBSG2,family=binomial)
ggPredict(fit,se=TRUE)
fit1=glm(cens~pnodes*age,data=GBSG2,family=binomial)
ggPredict(fit1)
ggPredict(fit1,colorn=100,jitter=FALSE,interactive=TRUE)
fit2=glm(cens~pnodes*age*horTh,data=GBSG2,family=binomial)
ggPredict(fit2,colorn=100,jitter=FALSE,interactive=TRUE)



