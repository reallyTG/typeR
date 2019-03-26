library(vitality)


### Name: vitality
### Title: Fitting routines for the Vitality family of mortality models.
### Aliases: vitality vitality-package

### ** Examples

# vitality.k
data(daphnia)
time <- daphnia$days
survival_fraction <- daphnia$lx

results.modk <- vitality.k(time = time,
                           sdata = survival_fraction,
                           rc.data=TRUE, 
                           se=FALSE,
                           gfit=FALSE, 
                           datatype="CUM", 
                           ttol=.000001, 
                           init.params=FALSE, 
                           lower=c(0,-1,0), upper=c(100,50,50), 
                           pplot=TRUE, 
                           tlab="days", 
                           lplot=TRUE, 
                           cplot=TRUE, 
                           Iplot=TRUE, 
                           silent=TRUE)

# vitality.ku
data(rainbow_trout_for_k)
time <- rainbow_trout_for_k$days
survival_fraction <- rainbow_trout_for_k$survival

results.modku <- vitality.ku(time = time,
                             sdata = survival_fraction,
                             rc.data=TRUE,
                             se=FALSE,
                             gfit=FALSE,
                             datatype="CUM",
                             ttol=.000001,
                             init.params=FALSE,
                             lower=c(0,-1,0,0),upper=c(100,100,50,50),
                             pplot=TRUE,
                             tlab="days",
                             lplot=TRUE,
                             cplot=TRUE,
                             Iplot=TRUE,
                             silent=TRUE,
                             L=0)
# vitality.4p
data(swedish_females)
swe <- swedish_females
initial_age <- 20 # Could be adjusted
time <- initial_age:max(swedish_females$age)
survival_fraction <- swe$lx / swe$lx[1]
survival_fraction <- survival_fraction[time] # when first element <1 data is adjusted
sample_size <- swe$Lx[initial_age] #sample size

results.4par <- vitality.4p(time = time,
                            sdata = survival_fraction,
                            #init.params=FALSE,
                            init.params=c(0.012, 0.01, 0.1, 0.1),
                            lower = c(0, 0, 0, 0), upper = c(100,50,1,50),
                            rc.data = TRUE, 
                            se = sample_size, 
                            datatype = "CUM", 
                            ttol = 1e-06,
                            pplot = TRUE,
                            Iplot = TRUE,
                            Mplot = TRUE,
                            tlab = "years",
                            silent = FALSE)

# vitality.6p
data(swedish_females)
swe <- swedish_females
initial_age <- 0 
time <- swedish_females$age
survival_fraction <- swe$lx / swe$lx[1]
sample_size <- swe$Lx[1] #sample size

results.6par <- vitality.6p(time = time,
                            sdata = survival_fraction,
                            #init.params=FALSE,
                            init.params=c(0.012, 0.01, 0.1, 0.1, 0.1, 1),
                            lower = c(0, 0, 0, 0, 0, 0), upper = c(100,50,1,50,50,50),
                            rc.data = TRUE, 
                            se=FALSE,
                            #se = sample_size, 
                            datatype = "CUM", 
                            ttol = 1e-06,
                            pplot = TRUE,
                            Iplot = TRUE,
                            Mplot = TRUE,
                            tlab = "years",
                            silent = FALSE)



