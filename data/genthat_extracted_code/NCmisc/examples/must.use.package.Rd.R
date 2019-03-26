library(NCmisc)


### Name: must.use.package
### Title: Do everything possible to load an R package.
### Aliases: must.use.package

### ** Examples

# not run : run if you are ok to install/already have these packages
# must.use.package(c("MASS","nlme","lme4"),ask=FALSE)
# must.use.package("limma",bioC=TRUE)
# search() # show packages have loaded, then detach them again:
# sapply(paste("package",c("limma","MASS","nlme","lme4"),sep=":"),detach,character.only=TRUE)



