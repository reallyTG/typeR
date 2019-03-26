## ----message=FALSE, warning=FALSE----------------------------------------
library(maptools)
library(rgdal)
library(rgeos)

## ------------------------------------------------------------------------
grid_high <- GridTopology(cellcentre.offset=c(1,1),cellsize=c(1,1),cells.dim=c(10,10))
grid_sp <- SpatialGrid(grid_high)

## ------------------------------------------------------------------------
population <- as.numeric(scale(rpois(100,10)))

## ------------------------------------------------------------------------
grid_data <- SpatialGridDataFrame(grid_sp,data.frame(population))

## ----echo=-1-------------------------------------------------------------
par(mar=c(0,0,0,0))
plot(grid_data)
text(coordinates(grid_data),row.names(grid_data),col="red",cex=0.7)
plot(grid_data[1:2,1:2,"population"],add=TRUE,col="blue",lwd=3)

individual_points <- spsample(grid_data,2000,"random")
row.names(individual_points) <- as.character(1:2000)
points(individual_points,pch=16,cex=0.7)

## ------------------------------------------------------------------------
att.data <- data.frame(happiness=as.numeric(scale(runif(2000,1,10))),
                       income=as.numeric(scale(runif(2000,1,10))),
                       age=as.numeric(scale(round(runif(2000,20,50)))))
row.names(att.data) <- as.character(1:2000)
individual_data <- SpatialPointsDataFrame(individual_points,att.data)

## ------------------------------------------------------------------------
link.index <- over(individual_points,grid_sp)

## ------------------------------------------------------------------------
link.data <- over(individual_data,grid_data)
link.data <- data.frame(neighbourhood_index=link.index,link.data)
individual_data@data <- data.frame(individual_data@data,link.data)

## ------------------------------------------------------------------------
model.data.sp <- individual_data[order(individual_data$neighbourhood_index),]

## ------------------------------------------------------------------------
head(model.data.sp@data,10)

## ------------------------------------------------------------------------
MM <- as.data.frame(table(model.data.sp$neighbourhood_index))

## ------------------------------------------------------------------------
Utotal <- dim(MM)[1]
Unum <- MM[,2]
Uid <- rep(c(1:Utotal),Unum)

## ----message=FALSE, warning=FALSE----------------------------------------
library(spdep)
n <- nrow(model.data.sp)
Delta <- matrix(0,nrow=n,ncol=Utotal)
for(i in 1:Utotal) {
  Delta[Uid==i,i] <- 1
}
rm(i)

Delta <- as(Delta,"dgCMatrix")

## ------------------------------------------------------------------------
temp.coords <- coordinates(grid_sp)
distance <- array(0,c(Utotal,Utotal))
M <- array(0,c(Utotal,Utotal))
  for(i in 1:Utotal) {
    for(j in 1:Utotal){
      temp <- (temp.coords[i,1] - temp.coords[j,1])^2 + (temp.coords[i,2] - temp.coords[j,2])^2 
      distance[i,j] <- sqrt(temp)
      if(temp == 1) M[i,j] <- 1
    }
  }

## ------------------------------------------------------------------------
M <- M / rowSums(M)
M <- as(M,"dgCMatrix")

## ----message=FALSE, warning=FALSE----------------------------------------
library(RColorBrewer)
library(classInt)

## ------------------------------------------------------------------------
nb.15 <- dnearneigh(model.data.sp,0,1.5)

## ------------------------------------------------------------------------
dist.15 <- nbdists(nb.15,model.data.sp)
dist.15 <- lapply(dist.15,function(x) exp(-0.5 * (x / 1.5)^2))
mat.15 <- nb2mat(nb.15,glist=dist.15,style="W")
W <- as(mat.15,"dgCMatrix")

## ------------------------------------------------------------------------
rho <- 0.2
lambda <- 0.7
sigma2e <- 0.8
sigma2u <- 0.4
betas <- c(3,2,3,4,5)

## ------------------------------------------------------------------------
thetas <- as.numeric(solve(diag(Utotal) - lambda*M) %*% rnorm(Utotal,mean=0,sd=sqrt(sigma2u)))
grid_data$thetas_true <- thetas
image(grid_data,"thetas_true")

## ------------------------------------------------------------------------
X.mat <- as.matrix(model.data.sp@data[,c("happiness","income","age","population")])
X.mat <- cbind(rep(1,n),X.mat)
health <- as.numeric(solve(diag(n) - rho*W) %*% (X.mat %*% betas + Delta %*% thetas + rnorm(n,0,sqrt(sigma2e))))
model.data.sp$health <- health

## ------------------------------------------------------------------------
library(HSAR)
res.formula <- health ~ happiness + income + age + population
res <- hsar(res.formula,data=model.data.sp@data,W=W,M=M,Delta=Delta,burnin=100, Nsim=200)
summary(res)

## ------------------------------------------------------------------------
grid_data$theta.est <- thetas.est <- as.numeric(res$Mus)
image(grid_data,"theta.est",breaks=as.numeric(quantile(thetas.est)),col=brewer.pal(4,"Reds"))

## ---- eval=FALSE---------------------------------------------------------
#  res_1 <- hsar(res.formula,data=model.data.sp@data,W=NULL,M=M,Delta=Delta,burnin=100, Nsim=200)
#  summary(res_1)

## ---- eval=FALSE---------------------------------------------------------
#  res_2 <- hsar(res.formula,data=model.data.sp@data,W=W,M=NULL,Delta=Delta,burnin=100, Nsim=200)
#  summary(res_2)

