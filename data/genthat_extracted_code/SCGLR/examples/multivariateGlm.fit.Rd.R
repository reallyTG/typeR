library(SCGLR)


### Name: multivariateGlm.fit
### Title: Multivariate generalized linear regression
### Aliases: multivariateGlm.fit
### Keywords: internal

### ** Examples

## Not run: 
##D library(SCGLR)
##D 
##D # load sample data
##D data(genus)
##D 
##D # get variable names from dataset
##D n <- names(genus)
##D ny <- n[grep("^gen",n)]    # Y <- names that begins with "gen"
##D nx <- n[-grep("^gen",n)]   # X <- remaining names
##D 
##D # remove "geology" and "surface" from nx as surface
##D # is offset and we want to use geology as additional covariate
##D nx <-nx[!nx%in%c("geology","surface")]
##D 
##D # build multivariate formula
##D # we also add "lat*lon" as computed covariate
##D form <- multivariateFormula(ny,c(nx,"I(lat*lon)"),c("geology"))
##D 
##D # split genus dataset
##D sub <- sample(1:nrow(genus),100,replace=FALSE)
##D sub_fit <- (1:nrow(genus))[-sub]
##D 
##D # define family
##D fam <- rep("poisson",length(ny))
##D 
##D # fit the model
##D genus.scglr <- scglr(formula=form, data=genus, family=fam, K=4,
##D  offset=genus$surface, subset=sub_fit)
##D 
##D # xnew, the design matrix associated to sub-sample used for prediction
##D # note rhs parameter is introduced to take into account that the
##D # covariate part of the formula is composed of two differents sets
##D xnew <- model.matrix(form, data=genus[sub,], rhs=1:2)[,-1]
##D 
##D # prediction based on the scglr approch
##D pred.scglr <- multivariatePredictGlm(xnew,family=fam,
##D  beta=genus.scglr$beta, offset=genus$surface[sub])
##D cor.scglr <-diag(cor(pred.scglr,genus[sub,ny]))
##D plot(cor.scglr, col="red",ylim=c(-1,1))
##D 
##D # prediction based on classical poisson glm
##D X <- model.matrix(form, data=genus)[,-1]
##D Y <- genus[,ny]
##D genus.glm <- multivariateGlm.fit(Y[sub_fit,,drop=FALSE],X[sub_fit,,drop=FALSE],
##D              family=fam, offset=matrix(genus$surface[sub_fit],
##D              length(sub_fit),length(ny)),size=NULL)
##D coefs <- sapply(genus.glm,coef)
##D 
##D # rhs parameter is introduced to take into account that the
##D # covariate part of the formula is composed of two differents sets
##D pred.glm <- multivariatePredictGlm(xnew,family=fam,beta=coefs,
##D  offset=genus$surface[sub])
##D cor.glm <- diag(cor(pred.glm,genus[sub,ny]))
##D 
##D points(cor.glm, col="blue")
## End(Not run)



