library(SNSequate)


### Name: PREp
### Title: Percent relative error
### Aliases: PREp PREp.default
### Keywords: kernel equating

### ** Examples

#Example: Table 7.5 in Von Davier et al. (2004)

data(Math20EG)
mod.gauss<-ker.eq(scores=Math20EG,kert="gauss", hx = NULL, hy = NULL,degree=c(2, 3),design="EG")
PREp(mod.gauss,10)




