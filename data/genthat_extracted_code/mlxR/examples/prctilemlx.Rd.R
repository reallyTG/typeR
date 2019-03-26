library(mlxR)


### Name: prctilemlx
### Title: Percentiles of the empiricial distribution of longitudinal data
### Aliases: prctilemlx

### ** Examples

## Not run: 
##D   myModel <- inlineModel("
##D   [LONGITUDINAL]
##D   input = {ka, V, Cl}
##D   EQUATION:
##D   C = pkmodel(ka,V,Cl)
##D   
##D   [INDIVIDUAL]
##D   input = {ka_pop, V_pop, Cl_pop, omega_ka, omega_V, omega_Cl}
##D   DEFINITION:
##D   ka = {distribution=lognormal, reference=ka_pop, sd=omega_ka}
##D   V  = {distribution=lognormal, reference=V_pop,  sd=omega_V }
##D   Cl = {distribution=lognormal, reference=Cl_pop, sd=omega_Cl}
##D   ")
##D   
##D   N=2000
##D   
##D   pop.param   <- c(
##D     ka_pop  = 1,    omega_ka  = 0.5,
##D     V_pop   = 10,   omega_V   = 0.4,
##D     Cl_pop  = 1,    omega_Cl  = 0.3)
##D     
##D   res <- simulx(model     = myModel,
##D                 parameter = pop.param,
##D                 treatment = list(time=0, amount=100),
##D                 group     = list(size=N, level='individual'),
##D                 output    = list(name='C', time=seq(0,24,by=0.1)))
##D   # res$C is a data.frame with 2000x241=482000 rows and 3 columns
##D   head(res$C)
##D   # we can display the empirical percentiles of C using the default 
##D   # settings (i.e. percentiles of order 10%, 20%, ... 90%)
##D   prctilemlx(res$C)
##D   # The 3 quartiles (i.e. percentiles of order 25%, 50% and 75%) are displayed by 
##D   # selecting a 50% interval splitted into 2 subintervals
##D   prctilemlx(res$C, number=2, level=50)
##D   # A one 90% interval can be displayed using only one interval
##D   prctilemlx(res$C, number=1, level=90)
##D   # or 75 subintervals in order to better represent the continuous distribution 
##D   # of the data within this interval
##D   prctilemlx(res$C, number=75, level=90)
##D   # prctilemlx produces a ggplot object that can be modified
##D   pl <- prctilemlx(res$C, number=4, level=80) 
##D   pl + ylab("concentration") + ggtitle("predictive distribution")
##D   # The percentiles are not plotted by setting plot=FALSE
##D   pr.out <- prctilemlx(res$C, number=4, level=80, plot=FALSE)
##D   print(pr.out$proba)
##D   print(pr.out$color)
##D   print(pr.out$y[1:5,])
## End(Not run)



