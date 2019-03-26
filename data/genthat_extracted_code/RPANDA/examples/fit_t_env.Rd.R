library(RPANDA)


### Name: fit_t_env
### Title: Maximum likelihood fit of the environmental model of trait
###   evolution
### Aliases: fit_t_env

### ** Examples

data(Cetacea)
data(InfTemp)

# Simulate a trait with temperature dependence on the Cetacean tree
set.seed(123)
## No test: 
trait <- sim_t_env(Cetacea, param=c(0.1,-0.2), env_data=InfTemp, model="EnvExp", 
					root.value=0, step=0.001, plot=TRUE)

## Fit the Environmental-exponential model
  # Fit the environmental model
  result1=fit_t_env(Cetacea, trait, env_data=InfTemp, scale=TRUE)
  plot(result1)

  # Add to the plot the results from different smoothing of the temperature curve
  result2=fit_t_env(Cetacea, trait, env_data=InfTemp, df=10, scale=TRUE)
  lines(result2, col="red")

  result3=fit_t_env(Cetacea, trait, env_data=InfTemp, df=50, scale=TRUE)
  lines(result3, col="blue")

## Fit the environmental linear model

  fit_t_env(Cetacea, trait, env_data=InfTemp, model="EnvLin", df=50, scale=TRUE)

## Fit user defined model (note that several other environmental variables 
## can be simultaneously encapsulated in this function through the env argument)

  # We define the function for the model
  my_fun<-function(t, env_cont, param){ 
      param[1]*exp(param[2]*env_cont(t))
  }
  
  res<-fit_t_env(Cetacea, trait, env_data=InfTemp, model=my_fun, 
                 param=c(0.1,0), scale=TRUE)
  # Retrieve the parameters and compare to 'result1'
  res
  plot(res, col="red")
	

## Fit user defined environmental function

require(pspline)
  	 spline_result <- sm.spline(x=InfTemp[,1],y=InfTemp[,2], df=50)
  	 env_func <- function(t){predict(spline_result,t)}
  	 t<-unique(InfTemp[,1])
  	
  # We build the interpolated smoothing spline function
  	 env_data<-splinefun(t,env_func(t))
  
  # We then fit the model
  	 fit_t_env(Cetacea, trait, env_data=env_data)
  
## Various parameterization (box constraints, df, scaling of the curve...) example
 fit_t_env(Cetacea, trait, env_data=InfTemp, model="EnvLin", method="L-BFGS-B", 
 			scale=TRUE, lower=-30, upper=20, df=10)


## A very general model...

# We define the function for the Early-Burst/AC model:
maxtime = max(branching.times(Cetacea))

# sigma^2*e^(r*t)
my_fun_ebac <- function(t, env_cont, param){
    time = (maxtime - t)
    param[1]*exp(param[2]*time)
}

res<-fit_t_env(Cetacea, trait, env_data=InfTemp, model=my_fun_ebac,
                param=c(0.1,0), scale=TRUE)
res # note that "r" is positive: it's the AC model (~OU model on ultrametric tree)


 
## End(No test)



