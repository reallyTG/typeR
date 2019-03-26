library(HSAR)


### Name: sar
### Title: SAR model estimation
### Aliases: sar
### Keywords: spatial econometrics

### ** Examples

data(landprice)
head(landprice)

data(landSPDF)

# extract the land parcel level spatial weights matrix
library(spdep)
nb.25 <- dnearneigh(landSPDF,0,2500)
# to a weights matrix
dist.25 <- nbdists(nb.25,landSPDF)
dist.25 <- lapply(dist.25,function(x) exp(-0.5 * (x / 2500)^2))
mat.25 <- nb2mat(nb.25,glist=dist.25,style="W")
W <- as(mat.25,"dgCMatrix")

## run the sar() function
res.formula <- lnprice ~ lnarea + lndcbd + dsubway + dpark + dele + 
popden + crimerate + as.factor(year)

betas= coef(lm(formula=res.formula,data=landprice))

pars=list( rho = 0.5, sigma2e = 2.0, betas = betas )

## Not run: 
##D res <- sar(res.formula,data=landprice,W=W,
##D burnin=5000, Nsim=10000, thinning=1, parameters.start=pars)
##D summary(res)
## End(Not run)




