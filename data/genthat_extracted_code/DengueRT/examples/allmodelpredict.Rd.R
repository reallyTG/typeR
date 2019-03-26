library(DengueRT)


### Name: allmodelpredict
### Title: Real-time predictions of the final size and the turning point at
###   the end of the epidemic, the incidence and the cumulative number of
###   cases in future observations.
### Aliases: allmodelpredict

### ** Examples

## Not run: 
##D ## (data example 1)
##D data("dengueoutbreak1")
##D 
##D ## Using only the information until time point 20
##D ## Prediction of the final size and turning point at the end of epidemic,  
##D ## the incidence and the cumulative number of cases in the observation  
##D ## number 36 using only the Richards model
##D allmodelpredict(dengueoutbreak1$Incidence[1:20],dengueoutbreak1$Time[1:20],36, 
##D model = "Richards")
##D 
##D ## Using only the information until time point 22
##D ## Now using all built-in model, Prediction of the final size and turning point  
##D ## at the end of epidemic, the incidence and the cumulative number of cases 
##D ## in the observation number 30 
##D allmodelpredict(dengueoutbreak1$Incidence[1:22],dengueoutbreak1$Time[1:22],30, 
##D model = "all")
## End(Not run)

## (data example 2)
data("dengueoutbreak2")
## Using only the information until time point 18, Prediction of the final size and  
## turning point at the end of epidemic, the incidence and the cumulative number  
## of cases in the observation number 31 using only the 3P logistic model

allmodelpredict(dengueoutbreak2$Incidence[1:18],dengueoutbreak2$Time[1:18],31,
model = "logistic3P")

## Not run: 
##D ## Using only the information until time point 20
##D ## Now using all built-in model, Prediction of the final size and turning point 
##D ## at the end of  epidemic, the incidence and the cumulative number of cases  
##D ## in the observation number 30
##D allmodelpredict(dengueoutbreak2$Incidence[1:20],dengueoutbreak2$Time[1:20],34, 
##D model = "all")
## End(Not run)




