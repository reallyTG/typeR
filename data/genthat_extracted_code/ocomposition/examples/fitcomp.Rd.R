library(ocomposition)


### Name: fitcomp
### Title: Gibbs sampler for parameter estimation
### Aliases: fitcomp
### Keywords: compositional multivariate response

### ** Examples

	
data(data)	
out <- fitcomp(data$v, data$m, ~ log(m), ~ log(m) + log(n), n.sample = 50)
summary(out)

# predict distribution of votes in a country with 5-member median district

v.hat <- predict(out, data.frame(m=5)) 
plot(v.hat)		



