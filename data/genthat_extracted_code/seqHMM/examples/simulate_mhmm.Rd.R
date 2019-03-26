library(seqHMM)


### Name: simulate_mhmm
### Title: Simulate Mixture Hidden Markov Models
### Aliases: simulate_mhmm

### ** Examples

emission_probs_1 <- matrix(c(0.75, 0.05, 0.25, 0.95), 2, 2)
emission_probs_2 <- matrix(c(0.1, 0.8, 0.9, 0.2), 2, 2)
colnames(emission_probs_1) <- colnames(emission_probs_2) <- 
  c("heads", "tails")

transition_probs_1 <- matrix(c(9, 0.1, 1, 9.9) / 10, 2, 2)
transition_probs_2 <- matrix(c(35, 1, 1, 35) / 36, 2, 2)
rownames(emission_probs_1) <- rownames(transition_probs_1) <- 
  colnames(transition_probs_1) <- c("coin 1", "coin 2")
rownames(emission_probs_2) <- rownames(transition_probs_2) <- 
  colnames(transition_probs_2) <- c("coin 3", "coin 4")
  
initial_probs_1 <- c(1, 0)
initial_probs_2 <- c(1, 0)

n <- 50
set.seed(123)
covariate_1 <- runif(n)
covariate_2 <- sample(c("A", "B"), size = n, replace = TRUE, 
  prob = c(0.3, 0.7))
dataf <- data.frame(covariate_1, covariate_2)

coefs <- cbind(cluster_1 = c(0, 0, 0), cluster_2 = c(-1.5, 3, -0.7))
rownames(coefs) <- c("(Intercept)", "covariate_1", "covariate_2B")

sim <- simulate_mhmm(
  n = n, initial_probs = list(initial_probs_1, initial_probs_2), 
  transition_probs = list(transition_probs_1, transition_probs_2), 
  emission_probs = list(emission_probs_1, emission_probs_2), 
  sequence_length = 25, formula = ~covariate_1 + covariate_2,
  data = dataf, coefficients = coefs)

ssplot(sim$observations, hidden.paths = sim$states, plots = "both", 
  sortv = "from.start", sort.channel = 0, type = "I")

hmm <- build_mhmm(sim$observations, 
  initial_probs = list(initial_probs_1, initial_probs_2), 
  transition_probs = list(transition_probs_1, transition_probs_2), 
  emission_probs = list(emission_probs_1, emission_probs_2), 
  formula = ~covariate_1 + covariate_2,
  data = dataf)

fit <- fit_model(hmm)
fit$model

paths <- hidden_paths(fit$model)

ssplot(list(estimates = paths, true = sim$states), sortv = "from.start", 
  sort.channel = 2, ylab = c("estimated paths", "true (simulated)"), 
  type = "I")




