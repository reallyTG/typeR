library(Rprofet)


### Name: WOEClust_kmeans
### Title: Kmeans Variable Clustering
### Aliases: WOEClust_kmeans

### ** Examples

mydata <- ISLR::Default
mydata$ID = seq(1:nrow(mydata)) ## make the ID variable
mydata$default<-ifelse(mydata$default=="Yes",1,0) ## Creating numeric binary target variable

## create two new variables from bivariate normal
sigma <- matrix(c(45000,-3000,-3000, 55000), nrow = 2)
set.seed(10)
newvars <- MASS::mvrnorm(nrow(mydata),
                         mu=c(1000,200), Sigma=sigma)

mydata$newvar1 <- newvars[,1]
mydata$newvar2 <- newvars[,2]

binned <- BinProfet(mydata, id= "ID", target= "default", num.bins = 5) ## Binning variables

WOE_dat <- WOEProfet(binned, "ID","default")

## Cluster variables by WOEClust_kmeans
clusters <- WOEClust_kmeans(WOE_dat, id="ID", target="default", num_clusts=3)
clusters




