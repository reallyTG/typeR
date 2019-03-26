library(greport)


### Name: survReport
### Title: Survival Report
### Aliases: survReport

### ** Examples

## See tests directory test.Rnw for a live example
## Not run: 
##D   set.seed(1)
##D   n <- 400
##D   dat <- data.frame(t1=runif(n, 2, 5), t2=runif(n, 2, 5),
##D                     e1=rbinom(n, 1, .5), e2=rbinom(n, 1, .5),
##D                     treat=sample(c('a','b'), n, TRUE))
##D   dat <- upData(dat,
##D                 labels=c(t1='Time to operation',
##D                          t2='Time to rehospitalization',
##D                          e1='Operation', e2='Hospitalization',
##D                          treat='Treatment')
##D                 units=c(t1='year', t2='year'))
##D   survReport(Surv(t1, e1) + Surv(t2, e2) ~ treat, data=dat)
##D 
##D   dat <- upData(dat, labels=c(t1='Follow-up Time', t2='Time'),
##D                 cause=factor(sample(c('death','MI','censor'), n, TRUE),
##D                              c('censor', 'MI', 'death')))
##D   survReport(Surv(t1, cause) ~ treat, cause='death', data=dat)
##D   survReport(Surv(t1, cause) + Surv(t2, cause) ~ treat,
##D              cause=list(c('death', 'MI'), 'death'), data=dat)
##D   # Two plots for t1, one plot for t2
## End(Not run)



