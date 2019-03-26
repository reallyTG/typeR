library(intubate)


### Name: survival
### Title: Interfaces to survival package for data science pipelines.
### Aliases: ntbt_cch ntbt_coxph ntbt_pyears ntbt_survConcordance
###   ntbt_survexp ntbt_survfit ntbt_survreg ntbt_survSplit
### Keywords: intubate magrittr survival cch coxph pyears survConcordance
###   survexp survfit survreg survSplit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(survival)
##D 
##D ## cch
##D subcoh <- nwtco$in.subcohort
##D selccoh <- with(nwtco, rel==1|subcoh==1)
##D ccoh.data <- nwtco[selccoh,]
##D ccoh.data$subcohort <- subcoh[selccoh]
##D ccoh.data$histol <- factor(ccoh.data$histol,labels=c("FH","UH"))
##D ccoh.data$stage <- factor(ccoh.data$stage,labels=c("I","II","III","IV"))
##D ccoh.data$age <- ccoh.data$age/12 # Age in years
##D 
##D ## Original function to interface
##D cch(Surv(edrel, rel) ~ stage + histol + age, data = ccoh.data,
##D     subcoh = ~subcohort, id=~seqno, cohort.size=4028)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_cch(data = ccoh.data, Surv(edrel, rel) ~ stage + histol + age,
##D     subcoh = ~subcohort, id=~seqno, cohort.size=4028)
##D 
##D ## so it can be used easily in a pipeline.
##D ccoh.data %>%
##D   ntbt_cch(Surv(edrel, rel) ~ stage + histol + age,
##D     subcoh = ~subcohort, id=~seqno, cohort.size=4028)
##D     
##D ## coxph    
##D ## Original function to interface
##D vet2 <- survSplit(Surv(time, status) ~., veteran,
##D                   cut = c(60, 120), episode = "timegroup")
##D coxph(Surv(tstart, time, status) ~ karno*strata(timegroup) +
##D                 age + trt, data = vet2)
##D 
##D ## The interface reverses the order of data and formula
##D vet2 <- ntbt_survSplit(veteran, Surv(time, status) ~.,
##D                        cut = c(60, 120), episode = "timegroup")
##D ntbt_coxph(data = vet2, Surv(tstart, time, status) ~
##D               karno*strata(timegroup) + age + trt)
##D 
##D ## so it can be used easily in a pipeline.
##D veteran %>%
##D   ntbt_survSplit(Surv(time, status) ~.,
##D                  cut = c(60, 120), episode = "timegroup") %>%
##D   ntbt_coxph(Surv(tstart, time, status) ~ 
##D              karno*strata(timegroup) + age + trt)
##D 
##D ## pyears
##D hearta <- by(heart, heart$id,  
##D              function(x)x[x$stop == max(x$stop),]) 
##D hearta <- do.call("rbind", hearta) 
##D 
##D ## Original function to interface
##D pyears(Surv(stop/365.25, event) ~
##D          cut(age + 48, c(0,50,60,70,100)) + surgery,
##D        data = hearta, scale = 1)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_pyears(data = hearta,
##D             Surv(stop/365.25, event) ~
##D               cut(age + 48, c(0,50,60,70,100)) + surgery,
##D             scale = 1)
##D 
##D ## so it can be used easily in a pipeline.
##D hearta %>%
##D   ntbt_pyears(Surv(stop/365.25, event) ~
##D                 cut(age + 48, c(0,50,60,70,100)) + surgery,
##D               scale = 1)
##D 
##D ## survConcordance
##D ## Original function to interface
##D survConcordance(Surv(time, status) ~ age, data=lung)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_survConcordance(data=lung, Surv(time, status) ~ age)
##D 
##D ## so it can be used easily in a pipeline.
##D lung %>%
##D   ntbt_survConcordance(Surv(time, status) ~ age)
##D 
##D ## survexp
##D ## Original function to interface
##D fit1 <- survexp(futime ~ 1,data=jasa, 
##D                 rmap=list(sex="male", year=accept.dt,   
##D                           age=(accept.dt-birth.dt)),
##D                 method='conditional')
##D summary(fit1, times=1:10*182.5, scale=365)
##D 
##D ## The interface reverses the order of data and formula
##D fit1 <- ntbt_survexp(data=jasa, futime ~ 1,
##D                   rmap=list(sex="male", year=accept.dt,   
##D                             age=(accept.dt-birth.dt)),
##D                   method='conditional')
##D summary(fit1, times=1:10*182.5, scale=365)
##D 
##D ## so it can be used easily in a pipeline.
##D jasa %>%
##D   ntbt_survexp(futime ~ 1,
##D             rmap=list(sex="male", year=accept.dt,   
##D                       age=(accept.dt-birth.dt)),
##D             method='conditional') %>%
##D   summary(times=1:10*182.5, scale=365)
##D 
##D ## survfit
##D ## Original function to interface
##D survfit(Surv(time, status) ~ x, data = aml)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_survfit(data = aml, Surv(time, status) ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D aml %>%
##D   ntbt_survfit(Surv(time, status) ~ x)
##D 
##D aml %>%
##D   ntbt_survfit(Surv(time, status) ~ x) %>%
##D   plot(lty = 2:3)
##D 
##D 
##D ## survreg
##D ## Original function to interface
##D survreg(Surv(time, status) ~ ph.ecog + age + strata(sex), lung)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_survreg(lung, Surv(time, status) ~ ph.ecog + age + strata(sex))
##D 
##D ## so it can be used easily in a pipeline.
##D lung %>%
##D   ntbt_survreg(Surv(time, status) ~ ph.ecog + age + strata(sex))
##D 
##D ## survSplit
##D ## Original function to interface
##D vet2 <- survSplit(Surv(time, status) ~., veteran,
##D                   cut = c(60, 120), episode = "timegroup")
##D coxph(Surv(tstart, time, status) ~ karno*strata(timegroup) +
##D                 age + trt, data = vet2)
##D 
##D ## The interface reverses the order of data and formula
##D vet2 <- ntbt_survSplit(veteran, Surv(time, status) ~.,
##D                        cut = c(60, 120), episode = "timegroup")
##D ntbt_coxph(data = vet2, Surv(tstart, time, status) ~
##D            karno*strata(timegroup) + age + trt)
##D 
##D ## so it can be used easily in a pipeline.
##D veteran %>%
##D   ntbt_survSplit(Surv(time, status) ~.,
##D                  cut = c(60, 120),
##D                  episode = "timegroup") %>%
##D   ntbt_coxph(Surv(tstart, time, status) ~ 
##D              karno*strata(timegroup) + age + trt)
## End(Not run)



