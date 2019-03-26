library(miceFast)


### Name: fill_NA
### Title: 'fill_NA' function for the imputations purpose.
### Aliases: fill_NA

### ** Examples

## Not run: 
##D library(miceFast)
##D library(data.table)
##D library(magrittr)
##D 
##D data = cbind(as.matrix(airquality[,-5]),intercept=1,index=1:nrow(airquality),
##D              # a numeric vector - positive values
##D              weights = round(rgamma(nrow(airquality),3,3),1),
##D              # as.numeric is needed only for OOP miceFast - see on next pages
##D              groups = airquality[,5])
##D data_DT = data.table(data)
##D 
##D # simple mean imputation - intercept at position 6
##D data_DT[,Ozone_imp:=fill_NA(x=as.matrix(.SD),
##D                            model="lm_pred",
##D                            posit_y=1,
##D                            posit_x=c(6),w=.SD[['weights']]),by=.(groups)] %>%
##D # avg of 10 multiple imputations - last posit_x equal to 9 not 10
##D # because the groups variable is not included in .SD
##D .[,Solar_R_imp:=fill_NA_N(as.matrix(.SD),
##D                          model="lm_bayes",
##D                          posit_y=2,
##D                          posit_x=c(3,4,5,6,9),w=.SD[['weights']],times=10),by=.(groups)]
##D 
##D head(data_DT,10)
##D 
##D ######################
##D #OR using OOP miceFast
##D ######################
##D 
##D data = cbind(as.matrix(airquality[,-5]),intercept=1,index=1:nrow(airquality))
##D weights = rgamma(nrow(data),3,3) # a numeric vector - positive values
##D #a numeric vector not integers - positive values - sorted increasingly
##D groups = as.numeric(airquality[,5])
##D #a numeric vector not integers - positive values - not sorted
##D #groups = as.numeric(sample(1:8,nrow(data),replace=T))
##D 
##D model = new(miceFast)
##D model$set_data(data) # providing data by a reference
##D model$set_w(weights) # providing by a reference
##D model$set_g(groups)  # providing by a reference
##D 
##D #impute adapt to provided parmaters like w or g
##D #Simple mean - permanent imputation at the object and data
##D #variable will be replaced by imputations
##D model$update_var(1,model$impute("lm_pred",1,c(6))$imputations)
##D 
##D model$update_var(2,model$impute_N("lm_bayes",2,c(1,3,4,5,6),10)$imputations)
##D 
##D #Printing data and retrieving an old order if data was sorted by the grouping variable
##D head(cbind(model$get_data(),model$get_g(),model$get_w())[order(model$get_index()),],3)
##D #the same
##D head(cbind(data,groups,weights)[order(model$get_index()),],3)
##D 
## End(Not run)




