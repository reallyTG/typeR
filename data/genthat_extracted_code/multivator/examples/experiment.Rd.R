library(multivator)


### Name: experiment
### Title: Multivatriate hyperparameter (mhp) objects
### Aliases: experiment print.experiment get_mdm get_obs
###   head,experiment-method tail,experiment-method [,experiment-method
###   as.data.frame,experiment-method
###   as.data.frame,experiment,ANY,ANY-method experiment-class

### ** Examples


data(mtoys)
jj_expt <- experiment(toy_mm,toy_d)


# accessor methods:
get_obs(jj_expt)
get_mdm(jj_expt)


# estimation of coefficients:
beta_hat(jj_expt, toy_mhp, toy_LoF)

# use multem():
multem(toy_mm3, jj_expt, toy_mhp, toy_LoF,give=TRUE)





