library(ssfit)


### Name: fit.model
### Title: Fitting of parametric models using summary statistics
### Aliases: fit.model

### ** Examples

# estimate the mean of a N(2, 1) distribution

sim_function <- function(n, mu) {
	rnorm(n, unlist(mu), 1)
	}

features_function <- function(data) {
	a <- median(data)
	b <- sum(data) - (min(data) + max(data))
	c <- (min(data) + max(data)) / 2
	return(c(a, b, c))
	}
	
fit1 <- fit.model(p = 1, q = 3, n = 100, r = 100, starting_values = 5, h_vector = 0.1,
data_true = rnorm(100, 2, 1), sim_data = sim_function, features = features_function, 
n_iter = 50, print_results = TRUE, variances = TRUE) 



