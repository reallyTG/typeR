library(joineRmeta)


### Name: removeafter
### Title: Code to remove longitudinal information recorded after survival
###   outcome
### Aliases: removeafter

### ** Examples

 ## Not run: 
##D  #the dataset simdat3 in this package contains joint data where longitudinal
##D  #data exists after individual's survival times.
##D  str(simdat3)
##D 
##D  #first this data needs to be changed to a jointdata object
##D  jointdat3<-tojointdata(longitudinal = simdat3$longitudinal,
##D                   survival = simdat3$survival, id = 'id', longoutcome = 'Y',
##D                   timevarying = c('time','ltime'), survtime = 'survtime',
##D                   cens = 'cens',time = 'time')
##D 
##D  #then additional data recorded after the survival time can be removed
##D  jointdat3.1<-removeafter(data = jointdat3, longitudinal = 'Y',
##D                   survival = 'survtime', id = 'id', time = 'time')
##D 
##D  #we can compare the two datasets to see the removed data
##D  str(jointdat3)
##D  str(jointdat3.1)
##D  
## End(Not run)




