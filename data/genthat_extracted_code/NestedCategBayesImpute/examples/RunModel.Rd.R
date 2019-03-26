library(NestedCategBayesImpute)


### Name: RunModel
### Title: Run the mcmc sampler for the model.
### Aliases: RunModel
### Keywords: mcmc model

### ** Examples

### We now show how the sampler works using a sample from the 2012 ACS.
### The sample consists of 2000 households of sizes 2 to 6.
### Empty environment and load required libraries
rm(list = ls())
library(NestedCategBayesImpute)
library(dplyr)


### Set indicator for whether of not to move the household head
### Also set indicator for the weighting/capping option
HHhead_at_group_level <- TRUE #move head to the group level
weight_option <- TRUE #use weighting/capping option


### Use data included in package; head has been moved to the group level
### prepare data and specify variable indexes
orig.file <- system.file("extdata","origdata_newFormat.txt",
              package="NestedCategBayesImpute")
orig.data <- read.table(orig.file,header = TRUE, sep = " ")
orig.data$relate <- orig.data$relate - 1L #recode relate to 11 levels
household.size <- as.data.frame(table(orig.data$Hhindex))
household.size[,1] <- as.numeric(household.size[,1])
names(household.size) <- c("Hhindex", 'householdsize')
household <- orig.data %>% inner_join(household.size)
individual_variable_index = c(3:7)
household_variable_index = c(8:13) #last column must be household size


### Initialize the input data structure
orig <- initData(household,individual_variable_index,household_variable_index)


### Check first few lines of data; data contains households of sizes 2 to 6
head(household)


### Supply weights; one for each household size
### Also,must be ordered & no household size must be excluded
if(weight_option){
  struc_weight <- c(1/2,1/2,1/3,1/3,1/3)
} else {
  struc_weight <-rep(1,length(orig$n_star_h)) #just a dummy vector of ones
}


### Set mcmc parameters
mc <- list(nrun = 10, burn = 5, thin = 1)
mc$eff.sam <- (mc$nrun-mc$burn)/mc$thin


### Set number of categories for each household level variable
dHH <- rep(0,length(household_variable_index))
for (i in 1:length(dHH)) {
  dHH[i] <- max(household[,household_variable_index[i]])
  if (i == length(dHH) & !HHhead_at_group_level) {
  #When leaving head within household, model assumes that the HH size starts from 2
    dHH[length(dHH)] <- dHH[length(dHH)] - 1
  }
}


### Set hyper parameters
#aa, ab, ba & bb are gamma hyperparameters for alpha and beta
#blocksize is the number of households to sample at once (batch sampling)
#FF is the max number of group-level latent classes
#SS is the max number of individual-level classes
hyper <- list(FF=20 , SS=15, aa=0.25, ab=0.25,
    ba=0.25,bb=0.25,dHH = dHH, blocksize = 5000)


### Initialize parameters and output
para <- initParameters(orig,hyper,HHhead_at_group_level)
output <- initOutput(orig,hyper,mc)


### Set number of synthetic data and the mcmc indexes for them
mm <- 5
synindex <- sort(sample(seq((mc$burn +1),mc$nrun,by=mc$thin),mm,replace=FALSE))


### Run model
ModelResults <- RunModel(orig,mc,hyper,para,output,synindex,
                individual_variable_index,household_variable_index,
                HHhead_at_group_level,weight_option,struc_weight)


### View first few lines of the first synthetic data.
head((ModelResults$synData)[[1]])


### Some posterior summaries and plots
library(coda)
names(ModelResults$output)
dim(ModelResults$output$alphaout)
alpha_output <- mcmc(ModelResults$output$alphaout)
plot(alpha_output)
summary(alpha_output)

dim(ModelResults$output$betaout)
beta_output <- mcmc(ModelResults$output$betaout)
plot(beta_output)
summary(beta_output)




