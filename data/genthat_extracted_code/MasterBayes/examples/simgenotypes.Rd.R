library(MasterBayes)


### Name: simgenotypes
### Title: Genotype and Genotyping Error Simulation
### Aliases: simgenotypes
### Keywords: datagen

### ** Examples

pedigree<-cbind(1:10, rep(NA,10), rep(NA, 10))

gen_data<-simgenotypes(A=list(loc_1=c(0.5, 0.2, 0.1, 0.075, 0.025)), 
 E1=0.1, E2=0.1, ped=pedigree, no_dup=1)

summary(gen_data$G[[1]])
summary(gen_data$Gobs[[1]])



