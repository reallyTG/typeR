library(xxIRT)


### Name: model_gpcm
### Title: Generalized partial credit model
### Aliases: model_gpcm model_gpcm_prob model_gpcm_info model_gpcm_lik
###   model_gpcm_gendata model_gpcm_plot model_gpcm_plot_loglik
###   model_gpcm_jmle

### ** Examples

model_gpcm_gendata(10, 5, 3)
model_gpcm_gendata(10, 5, 3, set_initial=0, missing=.1)
# Figure 1 in Muraki, 1992 (APM)
model_gpcm_plot(a=c(1,1,.7), b=matrix(c(-2,0,2,-.5,0,2,-.5,0,2), nrow=3, byrow=TRUE), 
    d=NULL, D=1.0, add_initial=0, xaxis=seq(-4, 4, .1), type='prob')
# Figure 2 in Muraki, 1992 (APM)
model_gpcm_plot(a=.7, b=matrix(c(.5,0,NA,0,0,0), nrow=2, byrow=TRUE), 
    d=NULL, D=1.0, add_initial=0, xaxis=seq(-4, 4, .1))
# Figure 3 in Muraki, 1992 (APM)
model_gpcm_plot(a=c(.778,.946), b=matrix(c(1.759,-1.643,3.970,-2.764), nrow=2, byrow=TRUE), 
    d=NULL, D=1.0, add_initial=0)
# Figure 1 in Muraki, 1993 (APM)
model_gpcm_plot(a=1, b=matrix(c(0,-2,4,0,-2,2,0,-2,0,0,-2,-2,0,-2,-4), nrow=5, byrow=TRUE), 
    d=NULL, D=1.0)
# Figure 2 in Muraki, 1993 (APM)
model_gpcm_plot(a=1, b=matrix(c(0,-2,4,0,-2,2,0,-2,0,0,-2,-2,0,-2,-4), nrow=5, byrow=TRUE), 
    d=NULL, D=1.0, type='info', by_item=TRUE)
with(model_gpcm_gendata(5, 50, 3, set_initial=0), 
    model_gpcm_plot_loglik(u, a, b, NULL, show_mle=TRUE))
## Not run: 
##D data_tru <- model_gpcm_gendata(1500, 30, 3, set_initial=0)
##D data_est <- model_gpcm_jmle(data_tru$u, prior=NULL, debug=TRUE)
##D evaluate_gpcm_estimation(data_tru, data_est)
## End(Not run)



