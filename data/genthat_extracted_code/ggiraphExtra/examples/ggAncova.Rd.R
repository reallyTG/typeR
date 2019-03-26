library(ggiraphExtra)


### Name: ggAncova
### Title: Make an interactive plot for an ANCOVA model
### Aliases: ggAncova ggAncova.default ggAncova.formula ggAncova.lm

### ** Examples

require(moonBook)
require(ggplot2)
require(ggiraph)
ggAncova(radial,aes(age,NTAV,color=sex),interactive=TRUE)
fit=lm(NTAV~age+HBP,data=radial)
ggAncova(fit,interactive=TRUE)
ggAncova(NTAV~age+DM,data=radial)



