library(vitality)


### Name: vitality.6p
### Title: Fitting routine for the 2-process, 6-parameter vitality model
###   (with childhood hook).
### Aliases: vitality.6p

### ** Examples

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



