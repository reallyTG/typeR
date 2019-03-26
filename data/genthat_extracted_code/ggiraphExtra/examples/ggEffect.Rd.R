library(ggiraphExtra)


### Name: ggEffect
### Title: Visualize the effect of interaction between two continuous
###   independent variables on a response variable
### Aliases: ggEffect ggEffect.default ggEffect.formula ggEffect.lm

### ** Examples

require(ggplot2)
require(ggiraph)
ggEffect(mtcars,aes(x=wt,y=mpg,color=hp))
require(moonBook)
ggEffect(acs,aes(x=height,y=weight,color=smoking))
require(ggplot2)
require(ggiraph)
require(moonBook)
ggEffect(NTAV~age*smoking,data=radial)
require(moonBook)
require(ggplot2)
require(ggiraph)
fit=lm(age~sex*smoking,data=acs)
ggEffect(fit,interactive=TRUE)
ggEffect(radial,aes(x=age,y=NTAV,group=smoking))



