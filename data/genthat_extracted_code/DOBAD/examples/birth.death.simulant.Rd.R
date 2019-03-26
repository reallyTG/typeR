library(DOBAD)


### Name: birth.death.simulant
### Title: Simulation of birth-death processes with immigration
### Aliases: birth.death.simulant
### Keywords: math

### ** Examples

my.lambda = 2
my.mu = 3
my.nu =1
my.time = 0.5
my.start = 10
my.end = 2
my.n = 2000

# simulate a birth death trajectory
my.simulant=birth.death.simulant(t=my.time,X0=my.start,lambda=my.lambda,mu=my.mu,nu=my.nu)
print(my.simulant)

# summarize the simulated trajectory
BDsummaryStats(my.simulant)




