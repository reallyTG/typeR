library(RPANDA)


### Name: likelihood_t_env
### Title: Likelihood of a dataset under environmental models of trait
###   evolution.
### Aliases: likelihood_t_env

### ** Examples

data(Cetacea)
data(InfTemp)
## No test: 
# Simulate a trait with temperature dependence on the Cetacean tree
set.seed(123)

trait <- sim_t_env(Cetacea, param=c(0.1,-0.2), env_data=InfTemp, model="EnvExp", 
					root.value=0, step=0.001, plot=TRUE)
					
# Compute the likelihood 
likelihood_t_env(Cetacea, trait, param=c(0.1, 0), fun=InfTemp, model="EnvExp")

# Provide the times
brtime<-branching.times(Cetacea)
mtot<-max(brtime)
times<-mtot-brtime

likelihood_t_env(Cetacea,trait,param=c(0.1, 0), fun=InfTemp, 
                  times=times, mtot=mtot, model="EnvExp")

# Provide the environmental function rather than the dataset (faster if used recursively)

spline_result <- sm.spline(InfTemp[,1],InfTemp[,2], df=50)
env_func <- function(t){predict(spline_result,t)}
t<-unique(InfTemp[,1])
# We build the interpolated smoothing spline function
env_data<-splinefun(t,env_func(t))
  
likelihood_t_env(Cetacea, trait, param=c(0.1, 0), fun=env_data, 
                 times=times, mtot=mtot, model="EnvExp")
	
## End(No test)  



