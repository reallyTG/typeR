library(amap)


### Name: acpgen
### Title: Generalised principal component analysis
### Aliases: acpgen K W
### Keywords: multivariate

### ** Examples

data(lubisch)
lubisch <- lubisch[,-c(1,8)]
p <- acpgen(lubisch,h1=1,h2=1/sqrt(2))
plot(p,main='ACP robuste des individus')

# See difference with acp

p <- princomp(lubisch)
class(p)<- "acp"




