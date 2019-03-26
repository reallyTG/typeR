library(joineRmeta)


### Name: tojointdata
### Title: Function to change multi-study data into jointdata format
### Aliases: tojointdata

### ** Examples


   #simdat is a simulated dataset available in the joineRmeta package
   #it is supplied as a list of longitudinal and a list of survival datasets,
   #each list is of length equal to the number of studies in the entire
   #dataset.
   jointdat<-tojointdata(longitudinal = simdat$longitudinal,
                         survival = simdat$survival, id = 'id',
                         longoutcome = 'Y', timevarying = c('time','ltime'),
                         survtime = 'survtime', cens = 'cens', time = 'time')




