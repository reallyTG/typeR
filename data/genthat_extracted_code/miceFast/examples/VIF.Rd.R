library(miceFast)


### Name: VIF
### Title: 'VIF' function for assessing VIF.
### Aliases: VIF

### ** Examples

## Not run: 
##D library(miceFast)
##D library(data.table)
##D 
##D airquality2 = airquality
##D airquality2$Temp2 = airquality2$Temp**2
##D #install.packages("car")
##D #car::vif(lm(Ozone ~ ., data=airquality2))
##D 
##D 
##D data_DT = data.table(airquality2)
##D # VIF for variables at 1,3,4 positions - you include a y position to consider its NA values
##D data_DT[,.(vifs=VIF(x=as.matrix(.SD),
##D                     posit_y=1,
##D                     posit_x=c(2,3,4,5,6,7)))]
##D 
##D ######################
##D #OR using OOP miceFast
##D ######################
##D 
##D airquality2_mat = as.matrix(airquality2)
##D model = new(miceFast)
##D model$set_data(airquality2_mat)
##D 
##D as.vector(model$vifs(1,c(2,3,4,5,6,7)))
##D 
## End(Not run)




