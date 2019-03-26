library(BNPMIXcluster)


### Name: Y_ex_5_1
### Title: Simulated data for testing the _BNPMIXcluster_ package
### Aliases: Y_ex_5_1

### ** Examples


### Show the relation between Y_ex_5_1 and Z_latent_ex_5_1 ###

plot(y=Y_ex_5_1[[3]][,"Y1"],x=Z_latent_ex_5_1$Z1,pch=20,col=2); abline(v=c(5),lty=3)
plot(y=Y_ex_5_1[[3]][,"Y2"],x=Z_latent_ex_5_1$Z2,pch=20,col=2); abline(v=c(5),lty=3)
plot(y=Y_ex_5_1[[3]][,"Y3"],x=Z_latent_ex_5_1$Z3,pch=20,col=2); abline(v=c(5),lty=3)

  
##############################
#        Exercise 5.1        #
#      Data definition       #
##############################

### Code to generate Y_ex_5_1 from Z_latent_ex_5_1 ###

Y_ex_5_1 <- list()

## (I) ##
# Three continuous variables (Y1, Y2, Y3)
# defined as Yi = Zi, for i=1, 2, 3.
Y_ex_5_1[[1]] <- Z_latent_ex_5_1[,c("Z1","Z2","Z3")]

## (II) ##
# two binary variables (Y1 , Y3 ) defined as
# Y1 = I(Z1 > 5)
# Y3 = I(Z3 > 3)
Y_ex_5_1_i <- data.frame(matrix(NA,nrow=nrow(Z_latent_ex_5_1),ncol=2))
colnames(Y_ex_5_1_i) <- paste("Y",c(1,3),sep="")
Y_ex_5_1_i$Y1 <- findInterval( Z_latent_ex_5_1$Z1, c(-Inf,5,Inf) )-1
Y_ex_5_1_i$Y3 <- findInterval( Z_latent_ex_5_1$Z3, c(-Inf,3,Inf) )-1
Y_ex_5_1[[2]] <- Y_ex_5_1_i

## (III) ##
# two binary variables (Y1 , Y3 ) defined as in Scenario (II)
# one ordinal variable Y2 such that Y2 = I(4 < Z2 < 5) + 2 * I(z 2 > 5)
# and one continuous variable Y4 distributed N(0, 1)
Y_ex_5_1_i <- data.frame(matrix(NA,nrow=nrow(Z_latent_ex_5_1),ncol=4))
colnames(Y_ex_5_1_i) <- paste("Y",1:4,sep="")
Y_ex_5_1_i$Y1 <- Y_ex_5_1[[2]]$Y1
Y_ex_5_1_i$Y2 <- findInterval( Z_latent_ex_5_1$Z2, c(-Inf,4,5,Inf) )-1
Y_ex_5_1_i$Y3 <- Y_ex_5_1[[2]]$Y3
Y_ex_5_1_i$Y4 <- rnorm(n=nrow(Z_latent_ex_5_1),mean=0,sd=1)
Y_ex_5_1[[3]] <- Y_ex_5_1_i


Y_ex_5_1





