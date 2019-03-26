library(RPANDA)


### Name: likelihood_t_DD_geog
### Title: Likelihood of a dataset under diversity-dependent models with
###   biogeography.
### Aliases: likelihood_t_DD_geog

### ** Examples

data(Anolis.data)
phylo <- Anolis.data$phylo
pPC1 <- Anolis.data$data
geography.object <- Anolis.data$geography.object

# Compute the likelihood with geography using ML parameters for fit without geography
par <- c(log(0.01153294),-0.0006692378)
maxN<-max(vapply(geography.object$geography.object,function(x)max(rowSums(x)),1))
lh <- -likelihood_t_DD_geog(phylo,pPC1,par,geography.object,model="DDlin",maxN=maxN)



