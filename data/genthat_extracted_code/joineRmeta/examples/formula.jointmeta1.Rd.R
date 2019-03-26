library(joineRmeta)


### Name: formula.jointmeta1
### Title: Extract formulae from joint model fit
### Aliases: formula.jointmeta1

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

    #return the formula for the longitudinal fixed effects
    formula(onestagefit, type = 'Longitudinal')

    #return the formula for the time-to-event fixed effects
    formula(onestagefit, type = 'Survival')

    #return the formula for the individual level random effects
    formula(onestagefit, type = 'Rand_ind')

    #return the formula for the study level random effects
    formula(onestagefit, type = 'Rand_stud')





