library(mclust)


### Name: cdens
### Title: Component Density for Parameterized MVN Mixture Models
### Aliases: cdens
### Keywords: cluster

### ** Examples

z2 <- unmap(hclass(hcVVV(faithful),2)) # initial value for 2 class case

model <- me(modelName = "EEE", data = faithful, z = z2)
cdens(modelName = "EEE", data = faithful, logarithm = TRUE, 
      parameters = model$parameters)[1:5,]

data(cross)
odd <- seq(1, nrow(cross), by = 2)
oddBIC <- mclustBIC(cross[odd,-1]) 
oddModel <- mclustModel(cross[odd,-1], oddBIC) ## best parameter estimates
names(oddModel)

even <- odd + 1
densities <- cdens(modelName = oddModel$modelName, data = cross[even,-1], 
                   parameters = oddModel$parameters)
cbind(class = cross[even,1], densities)[1:5,]



