library(PBImisc)


### Name: corn
### Title: A datasets relatead to gene expression in corn
### Aliases: corn
### Keywords: corn

### ** Examples

## Not run: 
##D 
##D require(lme4)
##D 
##D names <- colnames(corn)
##D X <- t(matrix(unlist(strsplit(names, ".", fixed=T)), 3, 36))
##D X <- data.frame(X)
##D colnames(X) <- c("spec", "temp", "plant")
##D 
##D summary(X)
##D 
##D y <- corn[4662,]
##D lmer(y~spec*temp + (1|plant:spec:temp), data=X)
##D 
## End(Not run)



