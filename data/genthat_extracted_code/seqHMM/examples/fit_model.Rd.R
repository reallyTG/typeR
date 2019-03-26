library(seqHMM)


### Name: fit_model
### Title: Estimate Parameters of (Mixture) Hidden Markov Models and Their
###   Restricted Variants
### Aliases: fit_model

### ** Examples


# Hidden Markov model

data("mvad", package = "TraMineR")

mvad_alphabet <-
  c("employment", "FE", "HE", "joblessness", "school", "training")
mvad_labels <- c("employment", "further education", "higher education",
  "joblessness", "school", "training")
mvad_scodes <- c("EM", "FE", "HE", "JL", "SC", "TR")
mvad_seq <- seqdef(mvad, 17:86, alphabet = mvad_alphabet,
  states = mvad_scodes, labels = mvad_labels, xtstep = 6)

attr(mvad_seq, "cpal") <- colorpalette[[6]]

# Starting values for the emission matrix
emiss <- matrix(
  c(0.05, 0.05, 0.05, 0.05, 0.75, 0.05, # SC
    0.05, 0.75, 0.05, 0.05, 0.05, 0.05, # FE
    0.05, 0.05, 0.05, 0.4,  0.05, 0.4,  # JL, TR
    0.05, 0.05, 0.75, 0.05, 0.05, 0.05, # HE
    0.75, 0.05, 0.05, 0.05, 0.05, 0.05),# EM
  nrow = 5, ncol = 6, byrow = TRUE)

# Starting values for the transition matrix
trans <- matrix(0.025, 5, 5)
diag(trans) <- 0.9

# Starting values for initial state probabilities
initial_probs <- c(0.2, 0.2, 0.2, 0.2, 0.2)

# Building a hidden Markov model
init_hmm_mvad <- build_hmm(observations = mvad_seq,
  transition_probs = trans, emission_probs = emiss,
  initial_probs = initial_probs)

## Not run: 
##D set.seed(21)
##D fit_hmm_mvad <- fit_model(init_hmm_mvad, control_em = list(restart = list(times = 50)))
##D hmm_mvad <- fit_hmm_mvad$model
## End(Not run)

# save time, load the previously estimated model
data("hmm_mvad")

# Markov model
# Note: build_mm estimates model parameters from observations,
# no need for estimating with fit_model

mm_mvad <- build_mm(observations = mvad_seq)

# Comparing likelihoods, MM fits better
logLik(hmm_mvad)
logLik(mm_mvad)

## Not run: 
##D require("igraph") #for layout_in_circle
##D 
##D plot(mm_mvad, layout = layout_in_circle, legend.prop = 0.3,
##D   edge.curved = 0.3, edge.label = NA,
##D   vertex.label.pos = c(0, 0, pi, pi, pi, 0))
##D 
##D ##############################################################
##D 
##D 
##D #' # Three-state three-channel hidden Markov model
##D # See ?hmm_biofam for five-state version
##D 
##D data("biofam3c")
##D 
##D # Building sequence objects
##D marr_seq <- seqdef(biofam3c$married, start = 15,
##D   alphabet = c("single", "married", "divorced"))
##D child_seq <- seqdef(biofam3c$children, start = 15,
##D   alphabet = c("childless", "children"))
##D left_seq <- seqdef(biofam3c$left, start = 15,
##D   alphabet = c("with parents", "left home"))
##D 
##D # Define colors
##D attr(marr_seq, "cpal") <- c("violetred2", "darkgoldenrod2", "darkmagenta")
##D attr(child_seq, "cpal") <- c("darkseagreen1", "coral3")
##D attr(left_seq, "cpal") <- c("lightblue", "red3")
##D 
##D # Starting values for emission matrices
##D 
##D emiss_marr <- matrix(NA, nrow = 3, ncol = 3)
##D emiss_marr[1,] <- seqstatf(marr_seq[, 1:5])[, 2] + 1
##D emiss_marr[2,] <- seqstatf(marr_seq[, 6:10])[, 2] + 1
##D emiss_marr[3,] <- seqstatf(marr_seq[, 11:16])[, 2] + 1
##D emiss_marr <- emiss_marr / rowSums(emiss_marr)
##D 
##D emiss_child <- matrix(NA, nrow = 3, ncol = 2)
##D emiss_child[1,] <- seqstatf(child_seq[, 1:5])[, 2] + 1
##D emiss_child[2,] <- seqstatf(child_seq[, 6:10])[, 2] + 1
##D emiss_child[3,] <- seqstatf(child_seq[, 11:16])[, 2] + 1
##D emiss_child <- emiss_child / rowSums(emiss_child)
##D 
##D emiss_left <- matrix(NA, nrow = 3, ncol = 2)
##D emiss_left[1,] <- seqstatf(left_seq[, 1:5])[, 2] + 1
##D emiss_left[2,] <- seqstatf(left_seq[, 6:10])[, 2] + 1
##D emiss_left[3,] <- seqstatf(left_seq[, 11:16])[, 2] + 1
##D emiss_left <- emiss_left / rowSums(emiss_left)
##D 
##D # Starting values for transition matrix
##D trans <- matrix(c(0.9, 0.07, 0.03,
##D                 0,  0.9,  0.1,
##D                 0,    0,    1), nrow = 3, ncol = 3, byrow = TRUE)
##D 
##D # Starting values for initial state probabilities
##D inits <- c(0.9, 0.09, 0.01)
##D 
##D # Building hidden Markov model with initial parameter values
##D init_hmm_bf <- build_hmm(
##D   observations = list(marr_seq, child_seq, left_seq),
##D   transition_probs = trans,
##D   emission_probs = list(emiss_marr, emiss_child, emiss_left),
##D   initial_probs = inits)
##D 
##D # Fitting the model with different optimization schemes
##D 
##D # Only EM with default values
##D hmm_1 <- fit_model(init_hmm_bf)
##D hmm_1$logLik # -24179.1
##D 
##D # Only L-BFGS
##D hmm_2 <- fit_model(init_hmm_bf, em_step = FALSE, local_step = TRUE)
##D hmm_2$logLik # -22267.75
##D 
##D # Global optimization via MLSL_LDS with L-BFGS as local optimizer and final polisher
##D # This can be slow, use parallel computing by adjusting threads argument
##D # (here threads = 1 for portability issues)
##D hmm_3 <- fit_model(
##D   init_hmm_bf, em_step = FALSE, global_step = TRUE, local_step = TRUE,
##D   control_global = list(maxeval = 5000, maxtime = 0), threads = 1)
##D hmm_3$logLik # -21675.42
##D 
##D # EM with restarts, much faster than MLSL
##D set.seed(123)
##D hmm_4 <- fit_model(init_hmm_bf, control_em = list(restart = list(times = 5)))
##D hmm_4$logLik # -21675.4
##D 
##D # Global optimization via StoGO with L-BFGS as final polisher
##D # This can be slow, use parallel computing by adjusting threads argument
##D # (here threads = 1 for portability issues)
##D set.seed(123)
##D hmm_5 <- fit_model(
##D    init_hmm_bf, em_step = FALSE, global_step = TRUE, local_step = TRUE, 
##D    lb = -50, ub = 50, control_global = list(algorithm = "NLOPT_GD_STOGO", 
##D    maxeval = 2500, maxtime = 0), threads = 1)
##D hmm_5$logLik # -21675.4
##D 
##D ##############################################################
##D 
##D # Mixture HMM
##D 
##D data("biofam3c")
##D 
##D ## Building sequence objects
##D marr_seq <- seqdef(biofam3c$married, start = 15,
##D   alphabet = c("single", "married", "divorced"))
##D child_seq <- seqdef(biofam3c$children, start = 15,
##D   alphabet = c("childless", "children"))
##D left_seq <- seqdef(biofam3c$left, start = 15,
##D   alphabet = c("with parents", "left home"))
##D 
##D ## Choosing colors
##D attr(marr_seq, "cpal") <- c("#AB82FF", "#E6AB02", "#E7298A")
##D attr(child_seq, "cpal") <- c("#66C2A5", "#FC8D62")
##D attr(left_seq, "cpal") <- c("#A6CEE3", "#E31A1C")
##D 
##D ## Starting values for emission probabilities
##D # Cluster 1
##D B1_marr <- matrix(
##D   c(0.8, 0.1, 0.1, # High probability for single
##D     0.8, 0.1, 0.1,
##D     0.3, 0.6, 0.1, # High probability for married
##D     0.3, 0.3, 0.4), # High probability for divorced
##D   nrow = 4, ncol = 3, byrow = TRUE)
##D 
##D B1_child <- matrix(
##D   c(0.9, 0.1, # High probability for childless
##D     0.9, 0.1,
##D     0.9, 0.1,
##D     0.9, 0.1),
##D   nrow = 4, ncol = 2, byrow = TRUE)
##D 
##D B1_left <- matrix(
##D   c(0.9, 0.1, # High probability for living with parents
##D     0.1, 0.9, # High probability for having left home
##D     0.1, 0.9,
##D     0.1, 0.9),
##D   nrow = 4, ncol = 2, byrow = TRUE)
##D 
##D # Cluster 2
##D 
##D B2_marr <- matrix(
##D   c(0.8, 0.1, 0.1, # High probability for single
##D     0.8, 0.1, 0.1,
##D     0.1, 0.8, 0.1, # High probability for married
##D     0.7, 0.2, 0.1),
##D   nrow = 4, ncol = 3, byrow = TRUE)
##D 
##D B2_child <- matrix(
##D   c(0.9, 0.1, # High probability for childless
##D     0.9, 0.1,
##D     0.9, 0.1,
##D     0.1, 0.9),
##D   nrow = 4, ncol = 2, byrow = TRUE)
##D 
##D B2_left <- matrix(
##D   c(0.9, 0.1, # High probability for living with parents
##D     0.1, 0.9,
##D     0.1, 0.9,
##D     0.1, 0.9),
##D   nrow = 4, ncol = 2, byrow = TRUE)
##D 
##D # Cluster 3
##D B3_marr <- matrix(
##D   c(0.8, 0.1, 0.1, # High probability for single
##D     0.8, 0.1, 0.1,
##D     0.8, 0.1, 0.1,
##D     0.1, 0.8, 0.1, # High probability for married
##D     0.3, 0.4, 0.3,
##D     0.1, 0.1, 0.8), # High probability for divorced
##D   nrow = 6, ncol = 3, byrow = TRUE)
##D 
##D B3_child <- matrix(
##D   c(0.9, 0.1, # High probability for childless
##D     0.9, 0.1,
##D     0.5, 0.5,
##D     0.5, 0.5,
##D     0.5, 0.5,
##D     0.1, 0.9),
##D   nrow = 6, ncol = 2, byrow = TRUE)
##D 
##D 
##D B3_left <- matrix(
##D   c(0.9, 0.1, # High probability for living with parents
##D     0.1, 0.9,
##D     0.5, 0.5,
##D     0.5, 0.5,
##D     0.1, 0.9,
##D     0.1, 0.9),
##D   nrow = 6, ncol = 2, byrow = TRUE)
##D 
##D # Starting values for transition matrices
##D A1 <- matrix(
##D   c(0.80, 0.16, 0.03, 0.01,
##D     0,    0.90, 0.07, 0.03,
##D     0,    0,    0.90, 0.10,
##D     0,    0,    0,       1),
##D   nrow = 4, ncol = 4, byrow = TRUE)
##D 
##D A2 <- matrix(
##D   c(0.80, 0.10, 0.05, 0.03, 0.01, 0.01,
##D     0,    0.70, 0.10, 0.10, 0.05, 0.05,
##D     0,    0,    0.85, 0.01, 0.10, 0.04,
##D     0,    0,    0,    0.90, 0.05, 0.05,
##D     0,    0,    0,    0,    0.90, 0.10,
##D     0,    0,    0,    0,    0,       1),
##D   nrow = 6, ncol = 6, byrow = TRUE)
##D 
##D # Starting values for initial state probabilities
##D initial_probs1 <- c(0.9, 0.07, 0.02, 0.01)
##D initial_probs2 <- c(0.9, 0.04, 0.03, 0.01, 0.01, 0.01)
##D 
##D # Birth cohort
##D biofam3c$covariates$cohort <- cut(biofam3c$covariates$birthyr, c(1908, 1935, 1945, 1957))
##D biofam3c$covariates$cohort <- factor(
##D   biofam3c$covariates$cohort, labels=c("1909-1935", "1936-1945", "1946-1957"))
##D 
##D # Build mixture HMM
##D init_mhmm_bf <- build_mhmm(
##D   observations = list(marr_seq, child_seq, left_seq),
##D   initial_probs = list(initial_probs1, initial_probs1, initial_probs2),
##D   transition_probs = list(A1, A1, A2),
##D   emission_probs = list(list(B1_marr, B1_child, B1_left),
##D     list(B2_marr, B2_child, B2_left),
##D     list(B3_marr, B3_child, B3_left)),
##D   formula = ~sex + cohort, data = biofam3c$covariates,
##D   channel_names = c("Marriage", "Parenthood", "Residence"))
##D 
##D 
##D # Fitting the model with different settings
##D 
##D # Only EM with default values
##D mhmm_1 <- fit_model(init_mhmm_bf)
##D mhmm_1$logLik # -12713.08
##D 
##D # Only L-BFGS
##D mhmm_2 <- fit_model(init_mhmm_bf, em_step = FALSE, local_step = TRUE)
##D mhmm_2$logLik # -12966.51
##D 
##D # Use EM with multiple restarts
##D set.seed(123)
##D mhmm_3 <- fit_model(init_mhmm_bf, control_em = list(restart = list(times = 5, transition = FALSE)))
##D mhmm_3$logLik # -12713.08
## End(Not run)




