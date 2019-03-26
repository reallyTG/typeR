library(copula)


### Name: assocMeasures
### Title: Dependence Measures for Bivariate Copulas
### Aliases: tau rho kendallsTau spearmansRho iTau iRho calibKendallsTau
###   calibSpearmansRho tailIndex lambda tau-methods tau,ANY-method
###   tau,copula-method tau,archmCopula-method tau,amhCopula-method
###   tau,claytonCopula-method tau,frankCopula-method
###   tau,gumbelCopula-method tau,indepCopula-method tau,lowfhCopula-method
###   tau,upfhCopula-method tau,joeCopula-method tau,normalCopula-method
###   tau,tCopula-method tau,fgmCopula-method tau,plackettCopula-method
###   tau,moCopula-method tau,galambosCopula-method
###   tau,huslerReissCopula-method tau,tawnCopula-method
###   tau,tevCopula-method tau,evCopula-method tau,acopula-method
###   tau,nacopula-method tau,rotCopula-method rho-methods rho,ANY-method
###   rho,copula-method rho,normalCopula-method rho,tCopula-method
###   rho,claytonCopula-method rho,frankCopula-method
###   rho,gumbelCopula-method rho,amhCopula-method rho,fgmCopula-method
###   rho,plackettCopula-method rho,moCopula-method
###   rho,galambosCopula-method rho,huslerReissCopula-method
###   rho,indepCopula-method rho,lowfhCopula-method rho,upfhCopula-method
###   rho,tawnCopula-method rho,tevCopula-method rho,evCopula-method
###   rho,acopula-method rho,nacopula-method rho,rotCopula-method
###   lambda-methods lambda,ANY-method lambda,copula-method
###   lambda,evCopula-method lambda,claytonCopula-method
###   lambda,frankCopula-method lambda,gumbelCopula-method
###   lambda,indepCopula-method lambda,lowfhCopula-method
###   lambda,upfhCopula-method lambda,amhCopula-method
###   lambda,joeCopula-method lambda,plackettCopula-method
###   lambda,moCopula-method lambda,normalCopula-method
###   lambda,tCopula-method lambda,acopula-method lambda,nacopula-method
###   lambda,rotCopula-method iTau-methods iTau,ANY-method
###   iTau,copula-method iTau,ellipCopula-method iTau,normalCopula-method
###   iTau,tCopula-method iTau,archmCopula-method iTau,amhCopula-method
###   iTau,claytonCopula-method iTau,frankCopula-method
###   iTau,gumbelCopula-method iTau,joeCopula-method
###   iTau,plackettCopula-method iTau,fgmCopula-method
###   iTau,galambosCopula-method iTau,huslerReissCopula-method
###   iTau,tawnCopula-method iTau,tevCopula-method iTau,nacopula-method
###   iTau,acopula-method iTau,rotCopula-method iRho-methods
###   iRho,ANY-method iRho,copula-method iRho,ellipCopula-method
###   iRho,normalCopula-method iRho,tCopula-method iRho,archmCopula-method
###   iRho,claytonCopula-method iRho,frankCopula-method
###   iRho,gumbelCopula-method iRho,galambosCopula-method
###   iRho,huslerReissCopula-method iRho,tawnCopula-method
###   iRho,tevCopula-method iRho,plackettCopula-method
###   iRho,fgmCopula-method iRho,nacopula-method iRho,rotCopula-method
### Keywords: multivariate

### ** Examples

gumbel.cop <- gumbelCopula(3)
tau(gumbel.cop)
rho(gumbel.cop)
lambda(gumbel.cop)
iTau(joeCopula(), 0.5)
stopifnot(all.equal(tau(gumbel.cop), copGumbel@tau(3)),

          all.equal(lambda(gumbel.cop),
                    c(copGumbel@lambdaL(3), copGumbel@lambdaU(3)),
                    check.attributes=FALSE),

          all.equal(iTau (gumbel.cop, 0.681),
                    copGumbel@iTau(0.681))
)

## let us compute the sample versions
x <- rCopula(200, gumbel.cop)
cor(x, method = "kendall")
cor(x, method = "spearman")
## compare with the true parameter value 3
iTau(gumbel.cop, cor(x, method="kendall" )[1,2])
iRho(gumbel.cop, cor(x, method="spearman")[1,2])



