library(SNSequate)


### Name: gof
### Title: Functions to assess model fitting.
### Aliases: gof
### Keywords: Traditional equating methods

### ** Examples

data(Math20EG)
mod <- ker.eq(scores=Math20EG,kert="gauss",degree=c(2,3),design="EG")

gof(Math20EG[,1], mod$rj*mod$nx, method=c("FT", "KL"))




