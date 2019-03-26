library(RPANDA)


### Name: plot.fit_t.env
### Title: Plot the phenotypic evolutionary rate through time estimated by
###   the _fit_t_env_ function
### Aliases: plot.fit_t.env

### ** Examples

data(Cetacea)
data(InfTemp)

# Simulate a trait with temperature dependence on the Cetacean tree
set.seed(123)
## No test: 

trait <- sim_t_env(Cetacea, param=c(0.1,0.2), env_data=InfTemp, model="EnvExp", 
					root.value=0, step=0.01, plot=TRUE)


## Fit the Environmental-exponential model

result1=fit_t_env(Cetacea, trait, env_data=InfTemp, scale=TRUE)
plot(result1)

# further options
plot(result1, lty=2, lwd=2, col="red")
## End(No test)




