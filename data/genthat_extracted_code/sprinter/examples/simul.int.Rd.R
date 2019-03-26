library(sprinter)


### Name: simul.int
### Title: Function for simulating survival data with interactions
### Aliases: simul.int
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Create survival data with interactions:
simul <- simul.int(287578,n = 200, p = 1000,
                          beta.int = 1.0,
                          beta.main = 0.9, 
                          censparam = 1/20, 
                          lambda = 1/20)
#Show the effect sizes of the main effects and interactions of the simulated data set:
simul$info

# Extract the data set:
data <- simul$data

# Plot the Kaplan Meier:
simul.fit <- survfit(Surv(obs.time,obs.status) ~ 1, data = data)
plot(simul.fit)




