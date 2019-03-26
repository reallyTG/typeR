library(lavaSearch2)


### Name: defineCategoricalLink
### Title: Identify Categorical Links in LVM
### Aliases: defineCategoricalLink defineCategoricalLink.lvm
### Keywords: internal

### ** Examples

## Not run: 
##D defineCategoricalLink <- lavaSearch2:::defineCategoricalLink
##D defineCategoricalLink.lvm <- lavaSearch2:::defineCategoricalLink.lvm
##D 
##D ## linear model
##D m <- lvm(Y1~X1+X2,Y2~X1+X3)
##D categorical(m, K = 3) <- "X1"
##D try(defineCategoricalLink(m)) # error
##D 
##D categorical(m, K = 3, labels = 1:3) <- "X1"
##D defineCategoricalLink(m)
##D defineCategoricalLink(m, "Y~X1")
##D defineCategoricalLink(m, "X1:0|1")
##D defineCategoricalLink(m, "X1:1|2")
##D defineCategoricalLink(m, c("X1:0|1", "X1:1|2"))
##D defineCategoricalLink(m, c("Y~X1","Y~X2"))
##D defineCategoricalLink(m, c("Y~X2","Y~X1"))
##D 
##D ## latent variable model
##D m <- lvm()
##D regression(m) <- c(y1,y2,y3)~u
##D regression(m) <- u~x1+x2
##D latent(m) <- ~u
##D covariance(m) <- y1~y2
##D categorical(m, labels = as.character(1:3)) <- "X1"
##D 
##D defineCategoricalLink(m)
## End(Not run)




