library(isotone)


### Name: gpava
### Title: Generalized Pooled-Adjacent-Violators Algorithm (PAVA)
### Aliases: gpava print.pava plot.pava
### Keywords: models

### ** Examples


data(pituitary)
##different tie approaches
gpava(pituitary[,1],pituitary[,2], ties = "primary")
gpava(pituitary[,1],pituitary[,2], ties = "secondary")
gpava(pituitary[,1],pituitary[,2], ties = "tertiary")

##different target functions
gpava(pituitary[,1],pituitary[,2], solver = weighted.mean)
gpava(pituitary[,1],pituitary[,2], solver = weighted.median)
gpava(pituitary[,1],pituitary[,2], solver = weighted.fractile, p = 0.25)


##repeated measures
data(posturo)
res <- gpava(posturo[,1],posturo[,2:4], ties = "secondary")
plot(res)




