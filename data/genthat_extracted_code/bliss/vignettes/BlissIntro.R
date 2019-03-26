## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  library(bliss)

## ----eval=TRUE,include = TRUE--------------------------------------------
  param <- list(                        # define the "param" to simulate data
                Q=1,                    # the number of functional covariate
                n=100,                  # n is the sample size and p is the
                p=c(50),                # number of time observations of the curves
                beta_types=c("smooth"), # define the shape of the "true" coefficient function
                grids_lim=list(c(0,1))) # Give the beginning and the end of the observation's domain of the functions.

  data <- sim(param) # Simulate the data

## ----eval=TRUE, include = TRUE-------------------------------------------
  param <- list(            # define the required values of the Bliss method.
                iter=1e3,   # The number of iteration of the main numerical algorithm of Bliss.
                burnin=2e2, # The number of burnin iteration for the Gibbs Sampler
                K=c(3))     # The number of intervals of the beta

   
  res_bliss<-fit_Bliss(data=data,param=param,verbose=TRUE)
  
  # Structure of a Bliss object
  str(res_bliss)

## ----eval=TRUE, include = TRUE,fig.height=5,fig.width=7------------------
  param$ylim <- range(range(res_bliss$beta_posterior_density[[1]]$grid_beta_t),
                      c(-5,5))
  param$cols <- rev(heat.colors(100))
  image_Bliss(res_bliss$beta_posterior_density,param,q=1)
  lines(res_bliss$data$grids[[1]],res_bliss$Bliss_estimate[[1]],type="s",lwd=2)
  lines(res_bliss$data$grids[[1]],res_bliss$data$betas[[1]],col=2,lwd=2,type="s")

## ----eval=TRUE, include = TRUE,fig.height=5,fig.width=7------------------
  ylim <- range(range(res_bliss$Bliss_estimate[[1]]),
                range(res_bliss$Smooth_estimate[[1]]))
  plot_bliss(res_bliss$data$grids[[1]],
             res_bliss$Bliss_estimate[[1]],lwd=2)
  lines_bliss(res_bliss$data$grids[[1]],
             res_bliss$Smooth_estimate[[1]],lty=2)

## ----eval=FALSE, include = TRUE------------------------------------------
#     param <- list(Q=2,
#                   n=300,
#                   p=c(40,60),
#                   beta_shapes=c("simple","smooth"),
#                   grids_lim=list(c(0,1),c(0,2)))
#  
#    data <- sim(param)

## ----eval=FALSE, include = TRUE------------------------------------------
#    param <- list(       # define the required values of the Bliss method.
#       iter=1e3,         # The number of iteration of the main numerical algorithm of Bliss.
#       burnin=2e2,       # The number of burnin iteration for the Gibbs Sampler
#       K=c(3,3))         # The number of intervals of the beta
#  
#    res_Bliss_mult <- fit_Bliss(data=data,param=param)

## ----eval=FALSE, include = TRUE,fig.height=5,fig.width=7-----------------
#     q <- 1
#     param$ylim <- range(range(res_Bliss_mult$beta_posterior_density[[q]]$grid_beta_t),
#                         c(-5,5))
#     param$cols <- rev(heat.colors(100))
#     image_Bliss(res_Bliss_mult$beta_posterior_density,param,q=q)
#     lines(res_Bliss_mult$data$grids[[q]],res_Bliss_mult$Bliss_estimate[[q]],type="s",lwd=2)
#     lines(res_Bliss_mult$data$grids[[q]],res_Bliss_mult$data$betas[[q]],col=2,lwd=2,type="s")
#  
#    ylim <- range(range(res_Bliss_mult$Bliss_estimate[[q]]),
#                   range(res_Bliss_mult$Smooth_estimate[[q]]))
#     plot_bliss(res_Bliss_mult$data$grids[[q]],
#                res_Bliss_mult$Bliss_estimate[[q]],lwd=2,ylim=ylim)
#     lines(res_Bliss_mult$data$grids[[q]],
#           res_Bliss_mult$Smooth_estimate[[q]],lty=2)
#  
#  
#     q <- 2
#     param$ylim <- range(range(res_Bliss_mult$beta_posterior_density[[q]]$grid_beta_t),
#                         c(-5,5))
#     param$cols <- rev(heat.colors(100))
#     image_Bliss(res_Bliss_mult$beta_posterior_density,param,q=q)
#     lines(res_Bliss_mult$data$grids[[q]],res_Bliss_mult$Bliss_estimate[[q]],type="s",lwd=2)
#     lines(res_Bliss_mult$data$grids[[q]],res_Bliss_mult$data$betas[[q]],col=2,lwd=2,type="l")
#  
#     ylim <- range(range(res_Bliss_mult$Bliss_estimate[[q]]),
#                   range(res_Bliss_mult$Smooth_estimate[[q]]))
#     plot_bliss(res_Bliss_mult$data$grids[[q]],
#                res_Bliss_mult$Bliss_estimate[[q]],lwd=2,ylim=ylim)
#     lines(res_Bliss_mult$data$grids[[q]],
#           res_Bliss_mult$Smooth_estimate[[q]],lty=2)

## ----session,echo=FALSE,message=FALSE, warning=FALSE---------------------
  sessionInfo()

