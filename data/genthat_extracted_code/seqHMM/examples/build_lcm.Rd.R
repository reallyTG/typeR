library(seqHMM)


### Name: build_lcm
### Title: Build a Latent Class Model
### Aliases: build_lcm

### ** Examples

# Simulate observations from two classes
set.seed(123)
obs <- seqdef(rbind(
  matrix(sample(letters[1:3], 5000, TRUE, prob = c(0.1, 0.6, 0.3)), 500, 10),
  matrix(sample(letters[1:3], 2000, TRUE, prob = c(0.4, 0.4, 0.2)), 200, 10)))

# Initialize the model
set.seed(9087)
model <- build_lcm(obs, n_clusters = 2)

# Estimate model parameters
fit <- fit_model(model)

# How many of the observations were correctly classified:
sum(summary(fit$model)$most_probable_cluster == rep(c("Class 2", "Class 1"), times = c(500, 200)))

############################################################
## Not run: 
##D # LCM for longitudinal data
##D 
##D # Define sequence data
##D data("mvad", package = "TraMineR")
##D mvad_alphabet <- c("employment", "FE", "HE", "joblessness", "school",
##D   "training")
##D mvad_labels <- c("employment", "further education", "higher education",
##D   "joblessness", "school", "training")
##D mvad_scodes <- c("EM", "FE", "HE", "JL", "SC", "TR")
##D mvad_seq <- seqdef(mvad, 17:86, alphabet = mvad_alphabet, states = mvad_scodes,
##D   labels = mvad_labels, xtstep = 6)
##D   
##D # Initialize the LCM with random starting values
##D set.seed(7654)
##D init_lcm_mvad1 <- build_lcm(observations = mvad_seq,
##D   n_clusters = 2, formula = ~male, data = mvad)
##D 
##D # Own starting values for emission probabilities
##D emiss <- rbind(rep(1/6, 6), rep(1/6, 6))
##D 
##D # LCM with own starting values
##D init_lcm_mvad2 <- build_lcm(observations = mvad_seq,
##D   emission_probs = emiss, formula = ~male, data = mvad)
##D 
##D # Estimate model parameters (EM algorithm with random restarts)
##D lcm_mvad <- fit_model(init_lcm_mvad1, 
##D   control_em = list(restart = list(times = 5)))$model
##D 
##D # Plot the LCM
##D plot(lcm_mvad, interactive = FALSE, ncol = 2)
##D 
##D ###################################################################
##D 
##D # Binomial regression (comparison to glm)
##D 
##D require("MASS")
##D data("birthwt")
##D 
##D model <- build_lcm(
##D   observations = seqdef(birthwt$low), emission_probs = diag(2), 
##D   formula = ~age + lwt + smoke + ht, data = birthwt)
##D fit <- fit_model(model)
##D summary(fit$model)
##D summary(glm(low ~ age + lwt + smoke + ht, binomial, data = birthwt))
##D 
##D 
##D # Multinomial regression (comparison to multinom)
##D 
##D require("nnet")
##D 
##D set.seed(123)
##D n <- 100
##D X <- cbind(1, x1 = runif(n, 0, 1), x2 =  runif(n, 0, 1))
##D coefs <- cbind(0,c(-2, 5, -2), c(0, -2, 2))
##D pr <- exp(X %*% coefs)  + rnorm(n*3)
##D pr <- pr/rowSums(pr)
##D y <- apply(pr, 1, which.max)
##D table(y)
##D 
##D model <- build_lcm(
##D   observations = seqdef(y), emission_probs = diag(3), 
##D   formula = ~x1 + x2,  data = data.frame(X[, -1]))
##D fit <- fit_model(model)
##D summary(fit$model)
##D summary(multinom(y ~ x1 + x2, data = data.frame(X[,-1])))
## End(Not run)



