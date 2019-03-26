library(dcminfo)


### Name: dcminfo
### Title: The information matrix for diagnostic classification models (or
###   cognitive diagnostic models)
### Aliases: dcminfo

### ** Examples


#Example 1.
#The sandwich-type covariance matrix, the empirical cross-product information matrix,
#and the observed information matrix for the DINA model

simresp <- sim_DINA_N1000$simresp
head(simresp)

simdelta <- sim_DINA_N1000$simdelta
simdelta

simqmatrix <- sim_DINA_N1000$simqmatrix
simqmatrix

simAj <- sim_DINA_N1000$simAj
simAj

simMj <- sim_DINA_N1000$simMj
simMj

simAttrProbs <- sim_DINA_N1000$simAttrProbs
simAttrProbs

# The number of the item parameters
N_delta <- length(unlist(simdelta))
N_delta


#Example 1.1 The sandwich-type covariance matrix

Sw_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
                 q_matrix=simqmatrix, Mj=simMj, Aj=simAj)


Sw_se_delta <- sqrt(diag(Sw_res))[1:N_delta]

Sw_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=Sw_se_delta)
Sw_est_delta_se


#Example 1.2 The empirical cross-product information matrix

XPD_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
                  q_matrix=simqmatrix, Mj=simMj, Aj=simAj, info_type = "XPD")

# Calculate the covariance matrix of the model parameters based on the XPD matrix
inv_XPD_res <- solve(XPD_res)

XPD_se_delta <- sqrt(diag(inv_XPD_res))[1:N_delta]
XPD_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=XPD_se_delta)
XPD_est_delta_se


#Example 1.3 The observed information matrix

Obs_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
                  q_matrix=simqmatrix, Mj=simMj, Aj=simAj, info_type = "Obs")

# Calculate the covariance matrix of the model parameters based on the Obs matrix
inv_Obs_res <- solve(Obs_res)

Obs_se_delta <- sqrt(diag(inv_Obs_res))[1:N_delta]
Obs_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=Obs_se_delta)
Obs_est_delta_se


# Example 2.
#The sandwich-type covariance matrix, the empirical cross-product information matrix,
#and the observed information matrix for the C-RUM

simresp <- sim_CRUM_N1000$simresp
head(simresp)

simdelta <- sim_CRUM_N1000$simdelta
simdelta

simqmatrix <- sim_CRUM_N1000$simqmatrix
simqmatrix

simAj <- sim_CRUM_N1000$simAj
simAj

simMj <- sim_CRUM_N1000$simMj
simMj

simAttrProbs <- sim_CRUM_N1000$simAttrProbs
simAttrProbs

# The number of the item parameters
N_delta <- length(unlist(simdelta))
N_delta


#Example 2.1 The sandwich-type covariance matrix

Sw_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
                 q_matrix=simqmatrix, Mj=simMj, Aj=simAj)


Sw_se_delta <- sqrt(diag(Sw_res))[1:N_delta]

Sw_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=Sw_se_delta)
Sw_est_delta_se


#Example 2.2 The empirical cross-product information matrix

XPD_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
                  q_matrix=simqmatrix, Mj=simMj, Aj=simAj, info_type = "XPD")

# Calculate the covariance matrix of the model parameters based on the XPD matrix
inv_XPD_res <- solve(XPD_res)

XPD_se_delta <- sqrt(diag(inv_XPD_res))[1:N_delta]
XPD_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=XPD_se_delta)
XPD_est_delta_se


#Example 2.3 The observed information matrix

Obs_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
                  q_matrix=simqmatrix, Mj=simMj, Aj=simAj, info_type = "Obs")

# Calculate the covariance matrix of the model parameters based on the Obs matrix
inv_Obs_res <- solve(Obs_res)

Obs_se_delta <- sqrt(diag(inv_Obs_res))[1:N_delta]
Obs_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=Obs_se_delta)
Obs_est_delta_se


#Example 3. User-specified attribute mastery patterns

attr_mast_patt <- amps(q_matrix=simqmatrix)

Sw_res <- dcminfo(dat=simresp, delta=simdelta, attr_probs=simAttrProbs,
attr_mast_patt = attr_mast_patt, q_matrix=simqmatrix, Mj=simMj, Aj=simAj)

Sw_se_delta <- sqrt(diag(Sw_res))[1:N_delta]

Sw_est_delta_se <- data.frame(delta_est= unlist(simdelta), se_delta=Sw_se_delta)
Sw_est_delta_se


#Example 4. Using the gdina function from the CDM package
library("CDM")
d1 <- CDM::gdina(data = sim_DINA_N1000$simresp, q.matrix = sim_DINA_N1000$simqmatrix,
maxit= 1000, rule="DINA", linkfct = "logit", calc.se=FALSE)
delta <- d1$delta
N_delta <- length(unlist(delta))
attr_probs <- d1$control$attr.prob[,1]
attr_mast_patt <- amps(q_matrix=simqmatrix)
Mj <- d1$Mj
Aj <- d1$Aj


#Example 4.1 The sandwich-type covariance matrix

Sw_res <- dcminfo(dat=sim_DINA_N1000$simresp, delta=delta, attr_probs=attr_probs,
                 q_matrix=sim_DINA_N1000$simqmatrix, Mj=Mj, Aj=Aj)

Sw_se_delta <- sqrt(diag(Sw_res))[1:N_delta]

Sw_est_delta_se <- data.frame(delta_est= unlist(delta), se_delta=Sw_se_delta)
Sw_est_delta_se


#Example 4.2 The empirical cross-product information matrix

XPD_res <- dcminfo(dat=sim_DINA_N1000$simresp, delta=delta, attr_probs=attr_probs,
                  q_matrix=simqmatrix, Mj=Mj, Aj=Aj, info_type = "XPD")

# Calculate the covariance matrix of the model parameters based on the XPD matrix
inv_XPD_res <- solve(XPD_res)

XPD_se_delta <- sqrt(diag(inv_XPD_res))[1:N_delta]
XPD_est_delta_se <- data.frame(delta_est= unlist(delta), se_delta=XPD_se_delta)
XPD_est_delta_se


#Example 4.3 The observed information matrix

Obs_res <- dcminfo(dat=sim_DINA_N1000$simresp, delta=delta, attr_probs=attr_probs,
                  q_matrix=simqmatrix, Mj=Mj, Aj=Aj, info_type = "Obs")

# Calculate the covariance matrix of the model parameters based on the Obs matrix
inv_Obs_res <- solve(Obs_res)

Obs_se_delta <- sqrt(diag(inv_Obs_res))[1:N_delta]
Obs_est_delta_se <- data.frame(delta_est= unlist(delta), se_delta=Obs_se_delta)
Obs_est_delta_se





