library(cellVolumeDist)


### Name: fitVolDist
### Title: Fit a model for cell volume distribution under least squares
###   criteria.
### Aliases: fitVolDist
### Keywords: optimize

### ** Examples


## Not run: 
##D 
##D #############################################################
##D # Fit volume distribution data for A10 vSMC cell cultures
##D # as described in the above referenced paper
##D #############################################################
##D 
##D ## load the volume distributions in the "A10_vSMC_volume_data" dataset
##D data("A10_vSMC_volume_data")  
##D labs <- c("a","b","c","d")
##D 
##D ## the volume distributions representing 0 nM aphidicolin concentration
##D Aph0 <- list(Aph0_a, Aph0_b, Aph0_c, Aph0_d)
##D ## the associated cell cycle times
##D tAph0 <- c(tAph0_a, tAph0_b, tAph0_c, tAph0_d)   
##D ## fit each dataset
##D Aph0res <- list()
##D Aph0tab <- matrix(ncol=2,nrow=4)
##D for(i in 1:length(Aph0)) {
##D   Aph0res[[i]] <- fitVolDist(vol=volumes_A10_vSMC, freq=Aph0[[i]],
##D                              r=100,sigma_r=44, t=tAph0[i])
##D 
##D   Aph0tab[i,] <- coef(Aph0res[[i]])
##D }
##D Aph0tab <- rbind(Aph0tab, colMeans(Aph0tab))
##D colnames(Aph0tab) <- c("r", "sigma_r")
##D rownames(Aph0tab) <- c(labs, "mean values")
##D 
##D ## plot results 
##D par(mfrow=c(3,2))
##D 
##D for(i in 1:length(Aph0)) {
##D   pe <- signif(coef(Aph0res[[i]]),3)
##D   plot(volumes_A10_vSMC, Aph0[[i]], type="l", main= substitute(paste(
##D   "r: ", p1, ", ", sigma[r],": ",p2), 
##D   list(p1=pe[1], p2=pe[2])),
##D   xlab = expression(paste("volume (",mu, m^3,")", sep="")), 
##D   sub=paste("vol. dist. Aphidicolin 0 nM", labs[i]), ylab="frequency")
##D   
##D   lines(volumes_A10_vSMC, fitted(Aph0res[[i]]), col=2)
##D }
##D textplot("(Above) Volume distribution data
##D representing A10 vSMC cells 
##D cultured with 0 nM aphidicolin 
##D concentration (black) 
##D and model fit (red).  
##D (Right) Parameter estimates and 
##D mean estimates over the four fits",fixed.width=FALSE)
##D textplot(signif(Aph0tab,3))
##D 
##D ## the volume distributions representing 50 nM aphidicolin concentration
##D Aph50 <- list(Aph50_a, Aph50_b, Aph50_c, Aph50_d)
##D ## the associated cell cycle times
##D tAph50 <- c(tAph50_a, tAph50_b, tAph50_c, tAph50_d)   
##D ## fit each dataset
##D Aph50res <- list()
##D Aph50tab <- matrix(ncol=2,nrow=4)
##D for(i in 1:length(Aph50)) {
##D   Aph50res[[i]] <- fitVolDist(vol=volumes_A10_vSMC, freq=Aph50[[i]],
##D                              r=100,sigma_r=44, t=tAph50[i]) 
##D 
##D   Aph50tab[i,] <- coef(Aph50res[[i]])
##D }
##D Aph50tab <- rbind(Aph50tab, colMeans(Aph50tab))
##D colnames(Aph50tab) <- c("r", "sigma_r")
##D rownames(Aph50tab) <- c(labs, "mean values")
##D   
##D ## plot results 
##D par(mfrow=c(3,2))
##D 
##D for(i in 1:length(Aph50)) {
##D   pe <- signif(coef(Aph50res[[i]]),3)
##D   plot(volumes_A10_vSMC, Aph50[[i]], type="l", main= substitute(paste(
##D   "r: ", p1, ", ", sigma[r],": ",p2),
##D   list(p1=pe[1], p2=pe[2])),
##D   xlab = expression(paste("volume (", mu, m^3,")", sep="")),
##D   sub=paste("vol. dist. Aphidicolin 50 nM", labs[i]), ylab="frequency")
##D   
##D   lines(volumes_A10_vSMC, fitted(Aph50res[[i]]), col=2)
##D }
##D textplot("(Above) Volume distribution data
##D representing A10 vSMC cells 
##D cultured with 50 nM aphidicolin 
##D concentration (black) 
##D and model fit (red).  
##D (Right) Parameter estimates and 
##D mean estimates over the four fits",fixed.width=FALSE)
##D textplot(signif(Aph50tab,3))
##D 
##D ## the volume distributions representing 100 nM aphidicolin concentration
##D Aph100 <- list(Aph100_a, Aph100_b, Aph100_c, Aph100_d)
##D ## the associated cell cycle times
##D tAph100 <- c(tAph100_a, tAph100_b, tAph100_c, tAph100_d)   
##D ## fit each dataset
##D Aph100res <- list()
##D Aph100tab <- matrix(ncol=2,nrow=4)
##D for(i in 1:length(Aph100)) {
##D   Aph100res[[i]] <- fitVolDist(vol=volumes_A10_vSMC, freq=Aph100[[i]],
##D                              r=100,sigma_r=44, t=tAph100[i]) 
##D   Aph100tab[i,] <- coef(Aph100res[[i]])
##D }
##D Aph100tab <- rbind(Aph100tab, colMeans(Aph100tab))
##D colnames(Aph100tab) <- c("r", "sigma_r")
##D rownames(Aph100tab) <- c(labs, "mean values")
##D 
##D ## plot results 
##D par(mfrow=c(3,2))
##D 
##D for(i in 1:length(Aph100)) {
##D   pe <- signif(coef(Aph100res[[i]]),3)
##D   plot(volumes_A10_vSMC, Aph100[[i]], type="l", main= substitute(paste(
##D   "r: ", p1, ", ", sigma[r],": ",p2),
##D   list(p1=pe[1], p2=pe[2])),
##D   xlab = expression(paste("volume (",mu, m^3,")", sep="")),
##D   sub=paste("vol. dist. Aphidicolin 100 nM", labs[i]), ylab="frequency")
##D   
##D   lines(volumes_A10_vSMC, fitted(Aph100res[[i]]), col=2)
##D }
##D textplot("(Above) Volume distribution data
##D representing A10 vSMC cells 
##D cultured with 100 nM aphidicolin 
##D concentration (black) 
##D and model fit (red).  
##D (Right) Parameter estimates and 
##D mean estimates over the four fits",fixed.width=FALSE)
##D textplot(signif(Aph100tab,3))
##D 
## End(Not run)

#############################################################
# Fit volume distribution data for NIH3T3 cell cultures
# as described in the above referenced paper
#############################################################

## load the volume distributions in the "NIH3T3_volume_data" dataset
data("NIH3T3_volume_data")  
labs <- c("a","b","c","d")

## the volume distributions representing NIH3T3 cells 
NIH3T3 <- list(NIH3T3_a, NIH3T3_b, NIH3T3_c, NIH3T3_d)
## the associated cell cycle times
tNIH3T3 <- c(tNIH3T3_a, tNIH3T3_b, tNIH3T3_c, tNIH3T3_d)   
## fit each dataset
NIH3T3res <- list()
NIH3T3tab <- matrix(ncol=2,nrow=4)
for(i in 1:length(NIH3T3)) {
  NIH3T3res[[i]] <- fitVolDist(vol=volumes_nih3t3, freq=NIH3T3[[i]],
                               r=100,sigma_r=44, t=tNIH3T3[i])
  NIH3T3tab[i,] <- coef(NIH3T3res[[i]])
}
NIH3T3tab <- rbind(NIH3T3tab, colMeans(NIH3T3tab))
colnames(NIH3T3tab) <- c("r", "sigma_r")
rownames(NIH3T3tab) <- c(labs, "mean values")

## plot results 
par(mfrow=c(3,2))

for(i in 1:length(NIH3T3)) {
  pe <- signif(coef(NIH3T3res[[i]]),3)
  plot(volumes_nih3t3, NIH3T3[[i]], type="l", main= substitute(paste(
  "r: ", p1, ", ", sigma[r],": ",p2),
  list(p1=pe[1], p2=pe[2])),
  xlab = expression(paste("volume (",mu, m^3,")", sep="")),
  sub=paste("vol. dist. NIH3T3", labs[i]), ylab="frequency")
  
  lines(volumes_nih3t3, fitted(NIH3T3res[[i]]), col=2)
}
textplot("(Above) Volume distribution data
representing NIH3T3 cells 
cultured under normal
conditions (black) 
and model fit (red). 
(Right) Parameter estimates and 
mean estimates over the four fits",fixed.width=FALSE)
textplot(signif(NIH3T3tab,3))




