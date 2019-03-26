library(vitality)


### Name: vitality.4p
### Title: Fitting routine for the 2-process, 4-parameter vitality model
###   (no childhood hook).
### Aliases: vitality.4p

### ** Examples

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



