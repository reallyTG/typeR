## ----setup, include = FALSE----------------------------------------------
library(dplyr)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
set.seed(17)  # For reproducibility's sake

## ------------------------------------------------------------------------
library(mstate)
data(ebmt3)
head(ebmt3)

## ------------------------------------------------------------------------
tmat <- trans.illdeath(c('transplant', 'pr', 'rfs'))
tmat

## ------------------------------------------------------------------------
long <- msprep(time=c(NA, 'prtime', 'rfstime'), 
               status=c(NA, 'prstat', 'rfsstat'), 
               data=ebmt3, 
               trans=tmat, 
               keep=c('age', 'dissub'))
head(long)

## ------------------------------------------------------------------------
library(flexsurv)
models <- lapply(1:3, function(i) {
    flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='weibull')
})

## ------------------------------------------------------------------------
newdata <- data.frame(age="20-40", dissub="AML")

## ----example1------------------------------------------------------------
library(multistateutils)
predict_transitions(models, newdata, tmat, times=365)

## ----example2------------------------------------------------------------
pmatrix.simfs(models, tmat, newdata=newdata, t=365)

## ----example3------------------------------------------------------------
predict_transitions(models, newdata, tmat, times=365, ci=TRUE, M=10)

## ----example4------------------------------------------------------------
pmatrix.simfs(models, tmat, newdata=newdata, t=365, ci=TRUE, M=9)

## ------------------------------------------------------------------------
library(microbenchmark)
microbenchmark("multistateutils"=predict_transitions(models, newdata, tmat, times=365),
               "flexsurv"=pmatrix.simfs(models, tmat, newdata=newdata, t=365), times=10)

## ----example5------------------------------------------------------------
predict_transitions(models, newdata, tmat, times=seq(9)*365)

## ----example6------------------------------------------------------------
do.call('rbind', lapply(seq(9)*365, function(t) {
    pmatrix.simfs(models, tmat, newdata=newdata, t=t)
}))

## ----benchmarkmultipletimes----------------------------------------------
microbenchmark("multistateutils"=predict_transitions(models, newdata, tmat, times=seq(9)*365),
               "flexsurv"={do.call('rbind', lapply(seq(9)*365, function(t) {
                            pmatrix.simfs(models, tmat, newdata=newdata, t=t)}))
               }, times=10)

## ------------------------------------------------------------------------
predict_transitions(models, newdata, tmat, times=365, start_times = 365/2)

## ------------------------------------------------------------------------
predict_transitions(models, newdata, tmat, times=365, 
                    start_times = c(0.25, 0.5, 0.75) * 365)

## ------------------------------------------------------------------------
predict_transitions(models, newdata, tmat, times=seq(2)*365, 
                    start_times = c(0.25, 0.5, 0.75) * 365)

## ------------------------------------------------------------------------
microbenchmark("time"=predict_transitions(models, newdata, tmat, 
                                          times=seq(2)*365, 
                                          start_times = c(0.25, 0.5, 0.75)*365),
               times=10)

## ------------------------------------------------------------------------
newdata_multi <- data.frame(age=c("20-40", ">40"), dissub=c("AML", "CML"))

## ----exampleinds1--------------------------------------------------------
predict_transitions(models, newdata_multi, tmat, times=365)

## ----exampleinds2, error=T, eval=T---------------------------------------
pmatrix.simfs(models, tmat, newdata=newdata_multi, t=365)

## ----exampleinds3--------------------------------------------------------
do.call('rbind', lapply(seq(nrow(newdata_multi)), function(i) {
    pmatrix.simfs(models, tmat, newdata=newdata_multi[i, ], t=365)
}))

## ------------------------------------------------------------------------
models_arrival <- lapply(1:3, function(i) {
    if (i == 3) {
        flexsurvreg(Surv(time, status) ~ age + dissub + Tstart, data=long, dist='weibull')
    } else {
        
        flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='weibull')
    }
})

## ------------------------------------------------------------------------
models_arrival[[3]]

## ------------------------------------------------------------------------
newdata_arrival <- data.frame(age="20-40", dissub="AML", Tstart=0)

## ------------------------------------------------------------------------
predict_transitions(models_arrival, newdata_arrival, tmat, times=365, tcovs='Tstart')

## ------------------------------------------------------------------------
predict_transitions(models_arrival, newdata_arrival, tmat, times=365)

## ----tcovs1--------------------------------------------------------------
pmatrix.simfs(models_arrival, tmat, newdata=newdata_arrival, t=365, tcovs='Tstart')

## ----tcovs2--------------------------------------------------------------
pmatrix.simfs(models_arrival, tmat, newdata=newdata_arrival, t=365)

## ------------------------------------------------------------------------
models_mix <- lapply(1:3, function(i) {
    if (i == 1) {
        flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='weibull')
    } else if (i == 2) {
        flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='exp')
    } else {
        flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='lnorm')
    }
})

## ------------------------------------------------------------------------
predict_transitions(models_mix, newdata, tmat, times=365)

## ------------------------------------------------------------------------
pmatrix.simfs(models_mix, tmat, newdata=newdata, t=365)

## ------------------------------------------------------------------------
length_of_stay(models, 
               newdata=newdata,
               tmat, times=365.25*3,
               start_state='transplant')

## ------------------------------------------------------------------------
totlos.simfs(models, tmat, t=365.25*3, start=1, newdata=newdata)

## ------------------------------------------------------------------------
length_of_stay(models, 
               newdata=data.frame(age=c(">40", ">40"),
                                  dissub=c('CML', 'AML')),
               tmat, times=c(1, 3, 5)*365.25,
               start_state=c('transplant', 'pr'))

## ------------------------------------------------------------------------
time_points <- seq(0, 10, by=2) * 365.25
plot_predicted_pathway(models, tmat, newdata, time_points, 1)

## ------------------------------------------------------------------------
sim <- cohort_simulation(models, ebmt3[, c('age', 'dissub')], tmat)

## ------------------------------------------------------------------------
head(sim)

## ------------------------------------------------------------------------
sim2 <- cohort_simulation(models, ebmt3[, c('age', 'dissub')], tmat, 
                         start_state = sample(c(1, 2), nrow(ebmt3), replace=T))
head(sim2)

## ------------------------------------------------------------------------
sim3 <- cohort_simulation(models, ebmt3[, c('age', 'dissub')], tmat, 
                         start_state = sample(c(1, 2), nrow(ebmt3), replace=T),
                         start_time = seq(0, 10*(nrow(ebmt3)-1), by=10))
head(sim3)

## ------------------------------------------------------------------------
sim4 <- cohort_simulation(models, ebmt3[, c('age', 'dissub')], tmat, 
                         start_state = sample(c(1, 2), nrow(ebmt3), replace=T),
                         start_time = seq(0, 10*(nrow(ebmt3)-1), by=10),
                         time_limit = 10*365.25)
tail(sim4)

## ------------------------------------------------------------------------
sim %>%
    arrange(desc(time)) %>%
    head()

## ------------------------------------------------------------------------
# Make dataset with age in
n_lt20 <- sum(ebmt3$age == '<=20')
n_gt20 <- sum(ebmt3$age == '20-40')
n_gt40 <- sum(ebmt3$age == '>40')
ebmt3$age_cont <- 0
ebmt3$age_cont[ebmt3$age == '<=20'] <- runif(n_lt20, 1, 20)
ebmt3$age_cont[ebmt3$age == '20-40'] <- runif(n_gt20, 21, 40)
ebmt3$age_cont[ebmt3$age == '>40'] <- runif(n_gt40, 40, 80)

sim5 <- cohort_simulation(models, ebmt3[, c('age', 'dissub', 'age_cont')], tmat,
                          agelimit=36525, agecol='age_cont')

## ------------------------------------------------------------------------
sim5 %>%
    arrange(desc(time)) %>%
    head()

## ------------------------------------------------------------------------
head(ebmt3)

## ------------------------------------------------------------------------
long <- msprep(time=c(NA, 'prtime', 'rfstime'), 
               status=c(NA, 'prstat', 'rfsstat'), 
               data=ebmt3, 
               trans=tmat, 
               keep=c('age', 'dissub'))
head(long)

## ------------------------------------------------------------------------
ebmt3 %>% filter(id %in% 1:2)

## ------------------------------------------------------------------------
entry <- data.frame(id=c(1, 2, 2),
                    state=c(2, 2, 3),
                    time=c(23, 35, 360))
entry

## ------------------------------------------------------------------------
msprep2(entry, tmat)

## ------------------------------------------------------------------------
cens <- data.frame(id=1, censor_time=744)
msprep2(entry, tmat, censors = cens)

## ------------------------------------------------------------------------
covars <- ebmt3 %>% filter(id %in% 1:2) %>% select(id, age, dissub)
msprep2(entry, tmat, censors = cens, covars = covars)

## ------------------------------------------------------------------------
states <- c('healthy', 'illness', 'death')
tmat2 <- matrix(c(NA, 3, NA, 1, NA, NA, 2, 4, NA), nrow=3, ncol=3, 
                dimnames=list(states, states))
tmat2

## ------------------------------------------------------------------------
multistate_entry <- data.frame(id=c(rep(1, 2),
                                    rep(2, 4)),
                               state=c('illness', 'death',
                                       'illness', 'healthy', 'illness', 'death'),
                               time=c(6, 11,
                                      7, 12, 17, 22))
multistate_entry

## ------------------------------------------------------------------------
msprep2(multistate_entry, tmat2)

