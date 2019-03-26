library(GPCMlasso)


### Name: ctrl_GPCMlasso
### Title: Control function for GPCMlasso
### Aliases: ctrl_GPCMlasso

### ** Examples

data(tenseness_small)

## formula for simple model without covariates
form.0 <- as.formula(paste("cbind(",paste(colnames(tenseness_small)[1:5],collapse=","),")~0"))

######
## fit simple RSM where loglikelihood and score function are evaluated parallel on 2 cores
rsm.0 <- GPCMlasso(form.0, tenseness_small, model = "RSM", 
control= ctrl_GPCMlasso(cores=2))
rsm.0

## Not run: 
##D ## formula for model with covariates (and DIF detection)
##D form <- as.formula(paste("cbind(",paste(colnames(tenseness_small)[1:5],collapse=","),")~."))
##D 
##D ######
##D ## fit GPCM model with 10 different tuning parameters
##D gpcm <- GPCMlasso(form, tenseness_small, model = "GPCM", 
##D                   control = ctrl_GPCMlasso(l.lambda = 10))
##D gpcm
##D plot(gpcm)
##D pred.gpcm <- predict(gpcm)
##D trait.gpcm <- trait.posterior(gpcm)
##D 
##D ######
##D ## fit RSM, detect differential step functioning (DSF)
##D rsm.DSF <- GPCMlasso(form, tenseness_small, model = "RSM", DSF = TRUE, 
##D                      control = ctrl_GPCMlasso(l.lambda = 10))
##D rsm.DSF
##D plot(rsm.DSF)
##D 
##D ## create binary data set
##D tenseness_small_binary <- tenseness_small
##D tenseness_small_binary[,1:5][tenseness_small[,1:5]>1] <- 2
##D 
##D ######
##D ## fit and cross-validate Rasch model
##D set.seed(1860)
##D rm.cv <- GPCMlasso(form, tenseness_small_binary, model = "RM", cv = TRUE, 
##D                    control = ctrl_GPCMlasso(l.lambda = 10))
##D rm.cv
##D plot(rm.cv)
## End(Not run)



