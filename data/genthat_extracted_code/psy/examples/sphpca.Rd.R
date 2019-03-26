library(psy)


### Name: sphpca
### Title: Spherical Representation of a Correlation Matrix
### Aliases: sphpca
### Keywords: multivariate

### ** Examples

data(sleep)
sphpca(sleep[,c(2:5,7:11)])
## spherical representation of ecological and constitutional correlates in mammals

sphpca(sleep[,c(2:5,7:11)],method="rscal",output=TRUE)
## idem, but optimizes the representation of correlations between variables with distances between points

corsleep <- as.data.frame(cor(sleep[,c(2:5,7:11)],use="pairwise.complete.obs"))
sphpca(corsleep,input="Cor")
sphpca(corsleep,method="rscal",input="Cor")
## when missing data are numerous, the representation of a pairwise correlation
## matrix may be preferred (even if mathematical properties are not so good...)

sphpca(corsleep,method="rscal",input="Cor",h=180,f=180,nbsphere=1,back=TRUE)
## other option of presentation

##
# library(polycor)
# sleep$Predation <- as.ordered(sleep$Predation)
# sleep$Sleep.exposure <- as.ordered(sleep$Sleep.exposure)
# sleep$Danger <- as.ordered(sleep$Danger)
# corsleeph <- as.data.frame(hetcor(sleep[,c(2:5,7:11)])$correlations)
# sphpca(corsleeph,input="Cor",f=180)
# sphpca(corsleeph,method="rscal",input="Cor",f=180)
## --> Correlations between discrete variables may appear shoking to some statisticians (?)
## --> Representation of polychoric/polyserial correlations could be prefered in this situation



