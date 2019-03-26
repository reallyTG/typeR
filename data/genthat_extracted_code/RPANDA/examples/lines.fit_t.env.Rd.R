library(RPANDA)


### Name: lines.fit_t.env
### Title: Add to a plot line segments joining the phenotypic evolutionary
###   rate through time estimated by the _fit_t_env_ function
### Aliases: lines.fit_t.env

### ** Examples


## No test: 
data(Cetacea)
data(InfTemp)

# Plot estimated evolutionary rate as a function of the environmental data and time.
set.seed(123)
trait <- sim_t_env(Cetacea, param=c(0.1,-0.2), env_data=InfTemp, model="EnvExp", 
					root.value=0, step=0.01, plot=TRUE)


## Fit the Environmental-exponential model with different smoothing parameters

result1=fit_t_env(Cetacea, trait, env_data=InfTemp, scale=TRUE)
result2=fit_t_env(Cetacea, trait, env_data=InfTemp, scale=TRUE, df=10)

# first plot result1
plot(result1, lwd=3)

# add result2 to the current plot
lines(result2, lty=2, lwd=3, col="red")
## End(No test)




