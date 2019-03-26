library(ElemStatLearn)


### Name: spam
### Title: Email Spam Data
### Aliases: spam
### Keywords: datasets

### ** Examples

head(str(spam))
## Not run: 
##D if(require(prim)){ # This uses too much time!
##D    X <- spam[,1:57]
##D    Y <- ifelse(spam$spam=="spam", 1, 0)
##D    spam.prim1 <- prim.box(X, Y, threshold.type=1,  verbose=TRUE)
##D    summary(spam.prim1)
##D } # use of prim package.
## End(Not run)
# The following example uses too much time and must be put inside a
# dontrun construction. Also summary(spam.earth) killed the R process
# ...
## Not run: 
##D if(require(earth)){
##D    spam.earth <- earth(spam[, 1:57], spam$spam,
##D          glm=list(family=binomial),
##D          trace=1, keepxy=TRUE, degree=1, nfold=10)
##D    summary(spam.earth)
##D } # use of earth package
## End(Not run) # end of dontrun block
if(require(mda)){
 spam.mars <- mars(spam[, 1:57],
                   ifelse(spam$spam=="spam", 1, 0),
                   degree=1, nk=50, trace.mars=TRUE)
 summary(spam.mars)
} # end require(mda) block



