library(joineRmeta)


### Name: vcov.jointmeta1SE
### Title: Extract the variance covariance matrix from the bootstrapped
###   results
### Aliases: vcov.jointmeta1SE

### ** Examples

   #change example data to jointdata object
   jointdat2<-tojointdata(longitudinal = simdat2$longitudinal,
   survival = simdat2$survival, id = 'id',longoutcome = 'Y',
   timevarying = c('time','ltime'),
   survtime = 'survtime', cens = 'cens',time = 'time')

   #set variables to factors
   jointdat2$baseline$study <- as.factor(jointdat2$baseline$study)
   jointdat2$baseline$treat <- as.factor(jointdat2$baseline$treat)

   #fit multi-study joint model
   #note: for demonstration purposes only - max.it restricted to 5
   #model would need more iterations to truely converge
   onestagefit<-jointmeta1(data = jointdat2, long.formula = Y ~ 1 + time +
                           + treat + study, long.rand.ind = c('int', 'time'),
                           long.rand.stud = c('treat'),
                           sharingstrct = 'randprop',
                           surv.formula = Surv(survtime, cens) ~ treat,
                           study.name = 'study', strat = TRUE, max.it=5)

    ## Not run: 
##D         #calculate the SE
##D         onestagefitSE <- jointmetaSE(fitted = onestagefit, n.boot = 200)
##D 
##D         #extract the variance covariance matrix
##D         vcov(onestagefitSE)
##D     
## End(Not run)




