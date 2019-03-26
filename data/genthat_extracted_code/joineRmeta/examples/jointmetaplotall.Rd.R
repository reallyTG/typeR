library(joineRmeta)


### Name: jointmetaplotall
### Title: Arrange study plots into a grid
### Aliases: jointmetaplotall

### ** Examples

    ## Not run: 
##D     #change data to jointdata format
##D     jointdat<-tojointdata(longitudinal = simdat$longitudinal,
##D                           survival = simdat$survival, id = 'id',
##D                           longoutcome = 'Y', timevarying = c('time','ltime'),
##D                           survtime = 'survtime', cens = 'cens',
##D                           time = 'time')
##D 
##D     #ensure variables are correctly formatted
##D     jointdat$baseline$study <- as.factor(jointdat$baseline$study)
##D     jointdat$baseline$treat <- as.factor(jointdat$baseline$treat)
##D 
##D     #produce plots
##D     #note that inclusion of a smoother sometime results in error messages
##D     #see ggplot2 for error message interpretation
##D     sepplots<-jointmetaplot(dataset = jointdat, study = 'study',
##D                         longoutcome = 'Y', longtime = 'time',
##D                         survtime = 'survtime', cens = 'cens', id = 'id',
##D                         smoother = TRUE, studynames = c('Study 1', 'Study 2',
##D                         'Study 3', 'Study 4', 'Study 5'), type = 'Both')
##D 
##D     allplot2<-jointmetaplotall(plotlist = sepplots, ncol =2,
##D              top = 'All studies', type = 'Both')
##D    
## End(Not run)




