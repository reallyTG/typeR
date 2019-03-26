library(joineRmeta)


### Name: jointmeta2
### Title: Function to pool joint model fits in two stage MA
### Aliases: jointmeta2

### ** Examples

    ## Not run: 
##D     library(joineR)
##D 
##D     #change data to jointdata format
##D     jointdat<-tojointdata(longitudinal = simdat$longitudinal,
##D                           survival = simdat$survival, id = 'id',
##D                           longoutcome = 'Y',
##D                           timevarying = c('time','ltime'),
##D                           survtime = 'survtime', cens = 'cens',
##D                           time = 'time')
##D 
##D     #ensure variables are correctly formatted
##D     jointdat$baseline$study <- as.factor(jointdat$baseline$study)
##D     jointdat$baseline$treat <- as.factor(jointdat$baseline$treat)
##D 
##D     #subset the data by study
##D     for(i in 1:length(unique(jointdat$baseline$study))){
##D          idstemp<-jointdat$baseline$id[which(jointdat$baseline$study %in%
##D                                          unique(jointdat$baseline$study)[i])]
##D          temp<-subset(jointdat,idstemp)
##D          class(temp)<-'jointdata'
##D          assign(paste('jointdat',unique(jointdat$baseline$study)[i],
##D                       sep='.'),temp)
##D       }
##D 
##D     #############################
##D     ### Example using joineR fits
##D 
##D     #use the joineR package to fit study specific joint models
##D     joineRfit1<-joint(data = jointdat.1, long.formula = Y ~ 1 + time + treat,
##D                   surv.formula = Surv(survtime, cens) ~ treat,
##D                   model = 'intslope')
##D 
##D     joineRfit2<-joint(data = jointdat.2, long.formula = Y ~ 1 + time + treat,
##D                   surv.formula = Surv(survtime, cens) ~ treat,
##D                   model = 'intslope')
##D 
##D     joineRfit3<-joint(data = jointdat.3, long.formula = Y ~ 1 + time + treat,
##D                   surv.formula = Surv(survtime, cens) ~ treat,
##D                   model = 'intslope')
##D 
##D     joineRfit4<-joint(data = jointdat.4, long.formula = Y ~ 1 + time + treat,
##D                   surv.formula = Surv(survtime, cens) ~ treat,
##D                   model = 'intslope')
##D 
##D     joineRfit5<-joint(data = jointdat.5, long.formula = Y ~ 1 + time + treat,
##D                   surv.formula = Surv(survtime, cens) ~ treat,
##D                   model = 'intslope')
##D 
##D     joineRfit1SE<-jointSE(fitted = joineRfit1, n.boot = 200)
##D     joineRfit2SE<-jointSE(fitted = joineRfit2, n.boot = 200)
##D     joineRfit3SE<-jointSE(fitted = joineRfit3, n.boot = 200)
##D     joineRfit4SE<-jointSE(fitted = joineRfit4, n.boot = 200)
##D     joineRfit5SE<-jointSE(fitted = joineRfit5, n.boot = 200)
##D 
##D     joineRfits<-list(joineRfit1, joineRfit1SE,
##D     joineRfit2, joineRfit2SE,
##D     joineRfit3, joineRfit3SE,
##D     joineRfit4, joineRfit4SE,
##D     joineRfit5, joineRfit5SE)
##D 
##D     names(joineRfits)<-c('joineRfit1', 'joineRfit1SE',
##D                          'joineRfit2', 'joineRfit2SE',
##D                          'joineRfit3', 'joineRfit3SE',
##D                          'joineRfit4', 'joineRfit4SE',
##D                          'joineRfit5', 'joineRfit5SE')
##D 
##D     #perform the second stage of the two stage MA
##D     MAjoineRfits<-jointmeta2(fits = joineRmodels, SE = joineRmodelsSE,
##D                   longpar = c('time', 'treat1'), survpar = 'treat1',
##D                   assoc = TRUE, studynames = c('Study 1','Study 2',
##D                   'Study 3', 'Study 4', 'Study 5'))
##D 
##D     #produce forest plots
##D     library(meta)
##D     forest(MAjoineRfits$longMA$treat1)
##D     
## End(Not run)




