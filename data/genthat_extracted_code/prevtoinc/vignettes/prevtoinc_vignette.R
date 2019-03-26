## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=5, fig.height=3) 

## ----  warning=F, message=F----------------------------------------------
require(prevtoinc)

## ------------------------------------------------------------------------
example.dist <- create_dist_vec(function(x) dpois(x-1, 7), max.dist = 70)
example.dist.los <- create_dist_vec(function(x) dpois(x-1, lambda = 12),
                                    max.dist = 70)
data.pps.fast <- simulate_pps_fast(n.sample=5000,
                               P=0.05,
                               dist.X.loi = example.dist,
                               dist.X.los = example.dist.los)
head(data.pps.fast)

## ------------------------------------------------------------------------
data.fast.inc.theo <- simulate_incidence_stats_fast(P=0.05, 
                                                    dist.X.loi = example.dist,
                                                    dist.X.los = example.dist.los)
data.fast.inc.theo

## ------------------------------------------------------------------------
pat.1 <- list(dist.X.los = 
                create_dist_vec(function(x) dpois(x-1, lambda = 12),
                                70),
              I.p = 0.008,
              dist.X.loi = 
                create_dist_vec(function(x) dpois(x-1, lambda = 10),
                                70))

pat.2 <- list(dist.X.los = 
                create_dist_vec(function(x) dpois(x-1, lambda = 10),
                                70),
              I.p = 0.02,
              dist.X.loi = 
                create_dist_vec(function(x) dpois(x-1, lambda = 7),
                                70))

patient.list <- list(pat.1, pat.2)


# define distribution of patients
pat.1.prob <- 0.4; pat.2.prob <- 0.6
pat.dist.hosp <-  c(pat.1.prob, pat.2.prob)
hospital.1 <- list(inc.factor = 1,
                   pat.dist = pat.dist.hosp,
                   patient.list = patient.list)

## ---- warning = FALSE----------------------------------------------------
data.pps <- simulate_pps_data(n.sample=5000, 
                          steps=200, 
                          hospital=hospital.1)
head(data.pps)

## ------------------------------------------------------------------------
data.inc.theo <- simulate_incidence_stats(hospital.1, 365 * 1000)
# gives incidence rate I
data.inc.theo$I
# gives incidence proportion per admission
data.inc.theo$I.pp
# average length of stay of patients who did not have a HAI
data.inc.theo$x.los.wo.noso
# average length of stay of patients who had at least one HAI during their stay
data.inc.theo$x.los.only.noso

## ------------------------------------------------------------------------
calculate_I_smooth(data = data.pps,
                  method = "gren")
data.inc.theo$I

calculate_I_smooth(data = data.pps.fast,
                  method = "gren")
data.fast.inc.theo$I

## ------------------------------------------------------------------------
calculate_I_rhame(data.pps,
                  x.loi.hat = data.inc.theo$x.loi,
                  x.los.hat = data.inc.theo$x.los,
                  method = "method identifier")
data.inc.theo$I
data.inc.theo$I.pp

calculate_I_rhame(data.pps.fast,
                  x.loi.hat = data.fast.inc.theo$x.loi,
                  x.los.hat = data.fast.inc.theo$x.los,
                  method = "method identifier")
data.fast.inc.theo$I
data.fast.inc.theo$I.pp

## ------------------------------------------------------------------------
  calculate_I(data.pps.fast, data.fast.inc.theo)

## ------------------------------------------------------------------------
generate_I_fast(n.sample = 10000,
                P = 0.05,
                dist.X.loi = example.dist,
                data.theo = data.fast.inc.theo)

## ------------------------------------------------------------------------
A.loi.sample <- data.pps$A.loi[data.pps$A.loi>0]
# raw histogram of data
hist(A.loi.sample)
A.loi.smoothed <- monotone_smoother(A.loi.sample, method = "gren")
# estimated monotonously decreasing distribution
plot(A.loi.smoothed)

## ------------------------------------------------------------------------
# geometric distribution starting in 1 and cutoff at 70 with mean at about 8.
geom.dist <- create_dist_vec(geom_dist_fct, max.dist = 70)
# calculate mean
sum(1:length(geom.dist)*geom.dist)
# plot original distribution
plot(geom.dist)
geom.dist.lb <- length_biased_dist(geom.dist)
# plot length biased distribution
plot(geom.dist.lb)

## ------------------------------------------------------------------------
# length biased distribution from chunk above
length_unbiased_mean(geom.dist.lb)

