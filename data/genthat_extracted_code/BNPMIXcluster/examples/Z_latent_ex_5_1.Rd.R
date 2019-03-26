library(BNPMIXcluster)


### Name: Z_latent_ex_5_1
### Title: Simulated data for testing the _BNPMIXcluster_ package
### Aliases: Z_latent_ex_5_1

### ** Examples


### Visualizing the simulated data for clustering ###

require(scatterplot3d)

cluster_color <- c(rgb(1,0,0,alpha = 0.5),
                   rgb(0,0,1,alpha = 0.5),
                   rgb(0,0.5,0,alpha = 0.5))
cluster_color <- cluster_color[Z_latent_ex_5_1$cluster]
cluster_pch <- c(19,15,17)[Z_latent_ex_5_1$cluster]
par(mfrow=c(2,2))
par(mar=c(4,5,2,2))

scatterplot3d::scatterplot3d(x=Z_latent_ex_5_1$Z1,y = Z_latent_ex_5_1$Z2, z=Z_latent_ex_5_1$Z3,
              color=cluster_color,pch=cluster_pch,
              xlab="Z1",ylab="Z2",zlab="Z3",
              main="Simulated data in 3 clusters"
              )
par(mar=c(4,5,2,2))
plot(Z_latent_ex_5_1[,c("Z2","Z3")],col=cluster_color,pch=cluster_pch,xlab="Z2",ylab="Z3")
par(mar=c(4,5,2,2))
plot(Z_latent_ex_5_1[,c("Z1","Z3")],col=cluster_color,pch=cluster_pch,xlab="Z1",ylab="Z3")
par(mar=c(4,5,2,2))
plot(Z_latent_ex_5_1[,c("Z1","Z2")],col=cluster_color,pch=cluster_pch,xlab="Z1",ylab="Z2")


##############################
#        Exercise 5.1        #
#      Data definition       #
##############################

### Code to generate the simulated data from scratch ###
require(MASS)

set.seed(0)

n.sim <- 100
n.cluster <- 3
p <- 3

mu_Z_latent <- matrix( c( 2 , 2 , 5 ,
                          6 , 4 , 2 ,
                          1 , 6 , 2 ),
                      nrow=n.cluster, ncol=p, byrow=TRUE)

sigma_Z_latent <- array(dim=c(3,3,3))
sigma_Z_latent[,,1] <- diag(3)
sigma_Z_latent[,,2] <- matrix( c( 0.1 , 0 , 0 ,
                                    0 , 2 , 0 ,
                                    0 , 0 , 0.1 ),
                              nrow=n.cluster, ncol=p, byrow=TRUE)

sigma_Z_latent[,,3] <- matrix( c( 2 , 0   , 0   ,
                                  0 , 0.1 , 0   ,
                                  0 , 0   , 0.1 ),
                                  nrow=n.cluster, ncol=p, byrow=TRUE)

Z_cluster <- data.frame(cluster=sample(x=1:n.cluster,size=n.sim,replace=TRUE))

Z_latent <- matrix(NA,nrow=n.sim,ncol=p)

for( i in unique(Z_cluster$cluster) ) {
    Z_latent[Z_cluster[,1]==i,] <- MASS::mvrnorm( n=sum(Z_cluster[,1]==i),
                                                  mu=mu_Z_latent[i,],
                                                  Sigma=sigma_Z_latent[,,i] )
}
colnames(Z_latent) <- paste("Z",1:ncol(Z_latent),sep="")
Z_latent_ex_5_1 <- cbind(Z_cluster,Z_latent)
Z_latent_ex_5_1





