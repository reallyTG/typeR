library(joineRmeta)


### Name: jointmetaplot
### Title: Produce plots of longitudinal and survival outcomes
### Aliases: jointmetaplot

### ** Examples

    #change data to jointdata format
    jointdat<-tojointdata(longitudinal = simdat$longitudinal,
                          survival = simdat$survival, id = 'id',
                          longoutcome = 'Y', timevarying = c('time','ltime'),
                          survtime = 'survtime', cens = 'cens',
                          time = 'time')

    #ensure variables are correctly formatted
    jointdat$baseline$study <- as.factor(jointdat$baseline$study)
    jointdat$baseline$treat <- as.factor(jointdat$baseline$treat)

    #produce plots
    sepplots<-jointmetaplot(dataset = jointdat, study = 'study',
                        longoutcome = 'Y', longtime = 'time',
                        survtime = 'survtime', cens = 'cens', id = 'id',
                        smoother = TRUE, studynames = c('Study 1', 'Study 2',
                        'Study 3', 'Study 4', 'Study 5'), type = 'Both')



