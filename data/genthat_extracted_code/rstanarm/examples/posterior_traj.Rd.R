library(rstanarm)


### Name: posterior_traj
### Title: Estimate the subject-specific or marginal longitudinal
###   trajectory
### Aliases: posterior_traj

### ** Examples

## No test: 
  # Run example model if not already loaded
  if (!exists("example_jm")) example(example_jm)
  
  # Obtain subject-specific predictions for all individuals 
  # in the estimation dataset
  pt1 <- posterior_traj(example_jm, interpolate = FALSE, extrapolate = FALSE)
  head(pt1)
  
  # Obtain subject-specific predictions only for a few selected individuals
  pt2 <- posterior_traj(example_jm, ids = c(1,3,8))
  
  # If we wanted to obtain subject-specific predictions in order to plot the 
  # longitudinal trajectories, then we might want to ensure a full trajectory 
  # is obtained by interpolating and extrapolating time. We can then use the 
  # generic plot function to plot the subject-specific predicted trajectories
  # for the first three individuals. Interpolation and extrapolation is 
  # carried out by default.
  pt3 <- posterior_traj(example_jm)
  head(pt3) # predictions at additional time points compared with pt1 
  plot(pt3, ids = 1:3)
  
  # If we wanted to extrapolate further in time, but decrease the number of 
  # discrete time points at which we obtain predictions for each individual, 
  # then we could specify a named list in the 'control' argument
  pt4 <- posterior_traj(example_jm, control = list(ipoints = 10, epoints = 10, eprop = 0.5))
  
  # If we have prediction data for a new individual, and we want to
  # estimate the longitudinal trajectory for that individual conditional
  # on this new data (perhaps extrapolating forward from our last
  # longitudinal measurement) then we can do that. It requires drawing
  # new individual-specific parameters, based on the full likelihood,
  # so we must supply new data for both the longitudinal and event 
  # submodels. These are sometimes known as dynamic predictions.
  ndL <- pbcLong[pbcLong$id == 8, , drop = FALSE]
  ndE <- pbcSurv[pbcSurv$id == 8, , drop = FALSE]
  ndL$id <- "new_subject" # new id can't match one used in training data
  ndE$id <- "new_subject"
  pt5 <- posterior_traj(example_jm, 
                        newdataLong = ndL,
                        newdataEvent = ndE)
                        
  # By default it is assumed that the last known survival time for 
  # the individual is the time of their last biomarker measurement,
  # but if we know they survived to some later time then we can
  # condition on that information using the last_time argument
  pt6 <- posterior_traj(example_jm, 
                        newdataLong = ndL,
                        newdataEvent = ndE, 
                        last_time = "futimeYears")
  
  # Alternatively we may want to estimate the marginal longitudinal
  # trajectory for a given set of covariates. To do this, we can pass
  # the desired covariate values in a new data frame (however the only
  # covariate in our fitted model was the time variable, year). To make sure  
  # that we marginalise over the random effects, we need to specify an ID value
  # which does not correspond to any of the individuals who were used in the
  # model estimation and specify the argument dynamic=FALSE.
  # The marginal prediction is obtained by generating subject-specific 
  # predictions using a series of random draws from the random 
  # effects distribution, and then integrating (ie, averaging) over these. 
  # Our marginal prediction will therefore capture the between-individual 
  # variation associated with the random effects.
  nd <- data.frame(id = rep("new1", 11), year = (0:10 / 2))
  pt7 <- posterior_traj(example_jm, newdataLong = nd, dynamic = FALSE)
  head(pt7)  # note the greater width of the uncertainty interval compared 
             # with the subject-specific predictions in pt1, pt2, etc
  
  # Alternatively, we could have estimated the "marginal" trajectory by 
  # ignoring the random effects (ie, assuming the random effects were set 
  # to zero). This will generate a predicted longitudinal trajectory only
  # based on the fixed effect component of the model. In essence, for a 
  # linear mixed effects model (ie, a model that uses an identity link 
  # function), we should obtain a similar point estimate ("yfit") to the
  # estimates obtained in pt5 (since the mean of the estimated random effects
  # distribution will be approximately 0). However, it is important to note that
  # the uncertainty interval will be much more narrow, since it completely
  # ignores the between-individual variability captured by the random effects.
  # Further, if the model uses a non-identity link function, then the point
  # estimate ("yfit") obtained only using the fixed effect component of the
  # model will actually provide a biased estimate of the marginal prediction.
  # Nonetheless, to demonstrate how we can obtain the predictions only using 
  # the fixed effect component of the model, we simply specify 're.form = NA'. 
  # (We will use the same covariate values as used in the prediction for 
  # example for pt5).
  pt8 <- posterior_traj(example_jm, newdataLong = nd, dynamic = FALSE, 
                        re.form = NA)
  head(pt8)  # note the much narrower ci, compared with pt5
## End(No test)




