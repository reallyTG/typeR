library(lmvar)

# Set RNG seed
suppressWarnings(RNGversion("3.5.0"))
set.seed(345981)

# Set number of observations
n_obs = 5000

# Set betas
beta = c(-2,1,3,-1.5)
beta_sigma = c(-1.1,0.8,-0.5)

# Generate design matrices
intercept = rep.int( 1, n_obs)
l = length(beta) - 1
X = matrix( sample(-9:9, n_obs*l, replace = TRUE), nrow = n_obs, ncol = l)
X = as.matrix(cbind( intercept, X))

l = length(beta_sigma) - 1
X_sigma = matrix( sample(-1:1, n_obs*l, replace = TRUE), nrow = n_obs, ncol = l)
X_sigma = as.matrix(cbind( intercept, X_sigma))

rm( intercept, l)

X_col_names = sapply( 1:ncol(X), function(x){paste( "v", as.character(x-1), sep="")})
X_sigma_col_names = sapply( 1:ncol(X_sigma), function(x){paste( "v", as.character(x-1), sep="")})

colnames(X) = X_col_names
colnames(X_sigma) = X_sigma_col_names

# Generate response vector
mu = X %*% beta
sigma = exp( X_sigma %*% beta_sigma)
y = rnorm( n_obs, mu, sigma)
y_log = rlnorm( n_obs, meanlog = 0.1*mu, sdlog = sigma^0.1)

rm( mu, sigma, beta, beta_sigma)

# Remove intercept terms
X_col_names = X_col_names[-1]
X_sigma_col_names = X_sigma_col_names[-1]

X = as.matrix( X[,-1])
X_sigma = as.matrix( X_sigma[,-1])

colnames(X) = X_col_names
colnames(X_sigma) = X_sigma_col_names

rm( X_col_names, X_sigma_col_names)

# Fit  model
fit = lmvar( y, X, X_sigma)
fit_log = lmvar( log(y_log), X, X_sigma)
fit_no_intc = lmvar( y, X, X_sigma, intercept_mu = FALSE, intercept_sigma = FALSE)

rm( X, y, y_log, X_sigma , n_obs)
