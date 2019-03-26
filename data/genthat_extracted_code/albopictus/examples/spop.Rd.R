library(albopictus)


### Name: spop
### Title: An S4 class to represent an age-structured population
### Aliases: spop

### ** Examples

# Generate a population with stochastic dynamics
s <- spop(stochastic=TRUE)
# Add 1000 20-day-old individuals
add(s) <- data.frame(number=1000,age=20)

# Iterate one day without death and assume development in 20 (+-5) days (gamma-distributed)
iterate(s) <- data.frame(dev_mean=20,dev_sd=5,death=0)
print(developed(s))

# Iterate another day assuming no development but age-dependent survival
# Let each individual survive for 20 days (+-5) (gamma-distributed)
iterate(s) <- data.frame(death_mean=20,death_sd=5,dev=0)
print(dead(s))
# Note that the previous values of developed and dead will be overwritten by this command

# Generate a deterministic population and observe the difference
s <- spop(stochastic=FALSE)
add(s) <- data.frame(number=1000,age=20)

iterate(s) <- data.frame(dev_mean=20,dev_sd=5,death=0)
print(developed(s))

iterate(s) <- data.frame(death_mean=20,death_sd=5,dev=0)
print(dead(s))




