library(HSAR)


### Name: hsar
### Title: Hierarchical SAR model estimation
### Aliases: hsar
### Keywords: spatial econometrics

### ** Examples

library(spdep)

# Running the hsar() function using the Beijing land price data
data(landprice)

# load shapefiles of Beijing districts and land parcels
data(Beijingdistricts)
data(landSPDF)

plot(Beijingdistricts,border="green")
plot(landSPDF,add=TRUE,col="red",pch=16,cex=0.8)

# Define the random effect matrix
model.data <- landprice[order(landprice$district.id),]
head(model.data,50)

# the number of individuals within each neighbourhood
MM <- as.data.frame(table(model.data$district.id))
# the total number of neighbourhood, 100
Utotal <- dim(MM)[1]
Unum <- MM[,2]
Uid <- rep(c(1:Utotal),Unum)

n <- nrow(model.data)
Delta <- matrix(0,nrow=n,ncol=Utotal)
for(i in 1:Utotal) {
  Delta[Uid==i,i] <- 1
}
rm(i)
# Delta[1:50,1:10]
Delta <- as(Delta,"dgCMatrix")

# extract the district level spatial weights matrix using the queen's rule
nb.list <- poly2nb(Beijingdistricts)
mat.list <- nb2mat(nb.list,style="W")
M <- as(mat.list,"dgCMatrix")

# extract the land parcel level spatial weights matrix
nb.25 <- dnearneigh(landSPDF,0,2500)
# to a weights matrix
dist.25 <- nbdists(nb.25,landSPDF)
dist.25 <- lapply(dist.25,function(x) exp(-0.5 * (x / 2500)^2))
mat.25 <- nb2mat(nb.25,glist=dist.25,style="W")
W <- as(mat.25,"dgCMatrix")


## run the hsar() function
res.formula <- lnprice ~ lnarea + lndcbd + dsubway + dpark + dele + 
popden + crimerate + as.factor(year)

betas= coef(lm(formula=res.formula,data=landprice))
pars=list( rho = 0.5,lambda = 0.5, sigma2e = 2.0, sigma2u = 2.0, betas = betas )

## Not run: 
##D res <- hsar(res.formula,data=model.data,W=W,M=M,Delta=Delta,
##D burnin=5000, Nsim=10000, thinning = 1, parameters.start=pars)
##D summary(res)
##D 
##D # visualise the district level random effect
##D library(classInt)
##D library(RColorBrewer)
##D x <- as.numeric(res$Mus)
##D breaks <- classIntervals(x,4,"fisher")$brks
##D groups <- cut(x,breaks,include.lowest=TRUE,labels=FALSE)
##D palette <- brewer.pal(4, "Blues")
##D plot(Beijingdistricts,col=palette[groups],border="grey")
## End(Not run)




