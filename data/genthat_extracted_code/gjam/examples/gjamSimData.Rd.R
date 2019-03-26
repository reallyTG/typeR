library(gjam)


### Name: gjamSimData
### Title: Simulated data for gjam analysis
### Aliases: gjamSimData

### ** Examples

## Not run: 
##D ## ordinal data, show true parameter values
##D sim <- gjamSimData(S = 5, typeNames = 'OC')  
##D sim$ydata[1:5,]                              # example data
##D sim$trueValues$cuts                          # simulated partition
##D sim$trueValues$beta                          # coefficient matrix
##D 
##D ## continuous data censored at zero, note latent w for obs y = 0
##D sim <- gjamSimData(n = 5, S = 5, typeNames = 'CA')  
##D sim$w
##D sim$y
##D 
##D ## continuous and discrete data
##D types <- c(rep('DA',5), rep('CA',4))
##D sim   <- gjamSimData(n = 10, S = length(types), Q = 4, typeNames = types)
##D sim$typeNames
##D sim$ydata
##D                              
##D ## composition count data  
##D sim <- gjamSimData(n = 10, S = 8, typeNames = 'CC')
##D totalCount <- rowSums(sim$ydata)
##D cbind(sim$ydata, totalCount)  # data with sample effort
##D 
##D ## multiple categorical responses - compare matrix y and data.frqme ydata
##D types <- rep('CAT',2)
##D sim   <- gjamSimData(S = length(types), typeNames = types)
##D head(sim$ydata)
##D head(sim$y)
##D 
##D ## discrete abundance, heterogeneous effort 
##D S   <- 5
##D n   <- 1000
##D ef  <- list( columns = 1:S, values = round(runif(n,.5,5),1) )
##D sim <- gjamSimData(n, S, typeNames = 'DA', effort = ef)
##D sim$effort$values[1:20]
##D 
##D ## combinations of scales, partition only for 'OC' columns
##D types <- c('OC','OC','OC','CC','CC','CC','CC','CC','CA','CA','PA','PA')
##D sim   <- gjamSimData(S = length(types), typeNames = types)
##D sim$typeNames                           
##D head(sim$ydata)
##D sim$trueValues$cuts
## End(Not run)



