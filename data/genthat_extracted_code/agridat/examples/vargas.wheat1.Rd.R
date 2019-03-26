library(agridat)


### Name: vargas.wheat1
### Title: Wheat yields in 7 years with genetic and environment covariates
### Aliases: vargas.wheat1 vargas.wheat1.covs vargas.wheat1.traits

### ** Examples


## Not run: 
##D 
##D   data(vargas.wheat1.covs)
##D   data(vargas.wheat1.traits)
##D 
##D   require(pls)
##D   require(reshape2)
##D   
##D   # Yield as a function of non-yield traits
##D   Y0 <- vargas.wheat1.traits[,c('gen','rep','year','yield')]
##D   Y0 <- acast(Y0, gen ~ year, value.var='yield', fun=mean)
##D   Y0 <- sweep(Y0, 1, rowMeans(Y0))
##D   Y0 <- sweep(Y0, 2, colMeans(Y0)) # GxE residuals
##D   Y1 <- scale(Y0) # scaled columns
##D   X1 <- vargas.wheat1.traits[, -4] # omit yield
##D   X1 <- aggregate(cbind(ANT,MAT,GFI,PLH,BIO,HID,STW,NSM,NGM,
##D                         NGS,TKW,WTI,SGW,VGR,KGR) ~ gen, data=X1, FUN=mean)
##D   rownames(X1) <- X1$gen
##D   X1$gen <- NULL
##D   X1 <- scale(X1) # scaled columns
##D   m1 <- plsr(Y1~X1)
##D   loadings(m1)[,1,drop=FALSE] # X loadings in Table 1 of Vargas
##D 
##D   biplot(m1, cex=.5, which="x", var.axes=TRUE,
##D          main="vargas.wheat1 - gen ~ trait") # Vargas figure 2a
##D 
##D   # Yield as a function of environment covariates
##D   Y2 <- t(Y0)
##D   X2 <- vargas.wheat1.covs
##D   rownames(X2) <- X2$year
##D   X2$year <- NULL
##D   Y2 <- scale(Y2)
##D   X2 <- scale(X2)
##D   
##D   m2 <- plsr(Y2~X2)
##D   loadings(m2)[,1,drop=FALSE] # X loadings in Table 2 of Vargas
## End(Not run)



