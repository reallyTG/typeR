library(cmm)


### Name: LaborParticipation
### Title: Women's labor participation: 1967-1971
### Aliases: LaborParticipation
### Keywords: datasets

### ** Examples

data(LaborParticipation)
n <- c(t(ftable(LaborParticipation)))

##########################################################
#Sample kappa values

#matrix for obtaining transition matrices for consecutive years
at <- MarginalMatrix(var = c("67", "68", "69", "70", "71"),
  marg = list(c("67", "68") ,c("68", "69"), c("69", "70"), c("70", "71")),
  dim = c(2, 2, 2, 2, 2))

coeff <- SpecifyCoefficient("CohenKappa", arg = 2, rep = 4);
stats <- SampleStatistics(n, list(coeff,at), ShowParameters = FALSE)


##########################################################
#Fitting models for kappa
#matrix for obtaining transition matrices for consecutive years
at <- MarginalMatrix(var = c("67", "68", "69", "70", "71"),
  marg = list(c("67", "68") ,c("68", "69"), c("69", "70"), c("70", "71")),
  dim = c(2, 2, 2, 2, 2))

coeff <- SpecifyCoefficient("CohenKappa", arg = 2, rep = 4);

bt1 <- ConstraintMatrix(var = c(1), suffconfigs = c(), dim = c(4)); #equal kappas
bt2 <-  rbind(c(1,-2,1,0), c(0,1,-2,1));  #linear trend for kappas
model <- list(bt1, coeff,at)

m = MarginalModelFit(n, model, ShowParameters = FALSE, ShowProgress = 10)



