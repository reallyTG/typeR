library(LogrankA)


### Name: LogrankA
### Title: Logrank Test for Aggregated Survival Data
### Aliases: LogrankA
### Keywords: survival

### ** Examples

library(survival)
library(MASS)

## data: survival of australian aids patients (individual and aggregated)

aids2.ind <- Aids2 # import australian aids data
aids2.ind$status <- as.numeric(aids2.ind$status) - 1 # recode status to 0/1
stime.days <- aids2.ind$death - aids2.ind$diag # generate survival time in weeks
aids2.ind$stime <- round(stime.days / 7, 0)
aids2.ind$agegr <- cut(aids2.ind$age, # generate age groups
                       c(0, 20, 40, 60, 100), right = FALSE)
aids2.ind <- aids2.ind[ , c(5, 8, 9)] # keep only important columns
aids2.aggr <- aggregate(aids2.ind$stime, # transform to aggregated data
                        by = list(aids2.ind$status, aids2.ind$stime,
                                  aids2.ind$agegr),
                        FUN = length)
colnames(aids2.aggr) <- c("status", "stime", "agegr", "n")
# generate survival objects for individual and aggregated data
surv.ind <- Surv(aids2.ind$stime, aids2.ind$status)
surv.aggr <- Surv(aids2.aggr$stime, aids2.aggr$status)

## logrank test on individual and aggregated data

# logrank on individual data
LogrankA(surv = surv.ind,
         group = aids2.ind$agegr)
# logrank on aggregated data
LogrankA(surv = surv.aggr,
         group = aids2.aggr$agegr,
         weight = aids2.aggr$n)



