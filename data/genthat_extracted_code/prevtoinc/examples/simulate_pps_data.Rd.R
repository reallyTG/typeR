library(prevtoinc)


### Name: simulate_pps_data
### Title: Function to simulate PPS data
### Aliases: simulate_pps_data

### ** Examples


pat.1 <- list(dist.X.los = 
                   create_dist_vec(function(x) dpois(x-1, lambda = 12), 70),
              I.p = 0.008,
              dist.X.loi = 
                   create_dist_vec(function(x) dpois(x-1, lambda = 10), 70))

pat.2 <- list(dist.X.los = 
                   create_dist_vec(function(x) dpois(x-1, lambda = 10), 70),
              I.p = 0.02,
              dist.X.loi =
                   create_dist_vec(function(x) dpois(x-1, lambda = 7), 70))

patient.list <- list(pat.1, pat.2)


# define distribution of patients
pat.1.prob <- 0.4; pat.2.prob <- 0.6
pat.dist.hosp <- c(pat.1.prob, pat.2.prob)
hospital.1 <- list(inc.factor = 1,
                   pat.dist = pat.dist.hosp,
                   patient.list = patient.list)
data.pps <- simulate_pps_data(n.sample=1000, steps=200, hospital=hospital.1)                    




