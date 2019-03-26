library(MCPMod)


### Name: modelMeans
### Title: Calculate mean vectors for a given candidate set
### Aliases: modelMeans
### Keywords: misc

### ** Examples

doses <- c(0, 10, 25, 50, 100, 150)                                        
models <- list(linear = NULL, emax = c(25),                                
               logistic = c(50, 10.88111), exponential = c(85),            
               betaMod = matrix(c(0.33, 2.31, 1.39, 1.39), byrow=TRUE,nrow=2))
modelMeans(models, doses, std = TRUE)

# now non-standardized means
Models <- fullMod(models, doses, base = 0, maxEff = 0.4, scal = 200)                 
modelMeans(Models, doses, std = FALSE)



