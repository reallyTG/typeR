## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval = FALSE--------------------------------------------------------
#  install.packages("devtools")

## ----eval = FALSE--------------------------------------------------------
#  devtools::install_github("edwardslee/alphabetr")

## ------------------------------------------------------------------------
library(alphabetr)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("alphabetr")

## ------------------------------------------------------------------------
# using a string to be read as a csv file (ignore this and see next line of code)
strcsv <-'"chain","well","cdr3"\n"alpha","1","CAVTGGDKLIF"\n"alpha","1","CALDGDKIIF"\n"alpha","2","CAVTGGDKLIF"\n"beta","1","CASGLARAEQYF"\n"beta","2","CASSEGDKVIF"\n"beta","2","CSEVHTARTQYF"'
con <- textConnection(strcsv)
csv3 <- read.csv(con)

# looking at the csv file
head(csv3)

## ------------------------------------------------------------------------
# TCRA file
strcsv <-'"well","cdr3"\n"1","CAVTGGDKLIF"\n"1","CALDGDKIIF"\n"2","CAVTGGDKLIF"'
con_alpha <- textConnection(strcsv)
csv2_alpha <- read.csv(con_alpha)

# TCRB file
strcsv <-'"well","cdr3"\n"1","CASGLARAEQYF"\n"2","CASSEGDKVIF"\n"2","CSEVHTARTQYF"'
con_beta <- textConnection(strcsv)
csv2_beta <- read.csv(con_beta)

head(csv2_alpha)
head(csv2_beta)

## ----eval = FALSE--------------------------------------------------------
#  # if using one 3 column csv file, using the data argument
#  dat <- read_alphabetr(data = "alphabetr_data.csv")
#  
#  # if using two 2 col csv files, use the data_alpha and data_beta arguments
#  dat <- read_alphabetr(data_alpha = "alphabetr_data_alpha.csv"
#                        data_beta  = "alphabetr_data_beta.csv")

## ------------------------------------------------------------------------
# using a string to be read as a csv file (ignore this and see next line of code)
strcsv <-'"chain","well","cdr3"\n"alpha","1","CAVTGGDKLIF"\n"alpha","1","CALDGDKIIF"\n"alpha","2","CAVTGGDKLIF"\n"beta","1","CASGLARAEQYF"\n"beta","2","CASSEGDKVIF"\n"beta","2","CSEVHTARTQYF"'
con <- textConnection(strcsv)

# importing the csv file into the format that alphabetr will use
dat <- read_alphabetr(data = con)
dat

## ------------------------------------------------------------------------
# the cdr3 sequence of alpha_2
dat$alpha_lib[2]

# the cdr3 sequence of beta_3
dat$beta_lib[3]

## ------------------------------------------------------------------------
set.seed(290)   # to make the results reproducible
clonal <- create_clones(numb_beta = 1000,
                        dual_beta = 0.05,
                        dual_alpha = .3,
                        alpha_sharing = c(0.80, 0.15, 0.05),
                        beta_sharing  = c(0.75, 0.20, 0.05))

## ------------------------------------------------------------------------
# Clones ordered by beta index
ordered_clones <- clonal$ordered

# Clones randomly ordered in order to assign random clonal frequencies later 
random_clones <- clonal$TCR

# Clones that express two different alpha chains and two different beta chains
dual_alpha <- clonal$dual_alpha
dual_beta  <- clonal$dual_beta

## ------------------------------------------------------------------------
# single TCR clones
random_clones[5:7, ]

# dual TCR-alpha clones
random_clones[49:50, ]

# dual TCR-beta clones
random_clones[47:48, ]

## ------------------------------------------------------------------------
# Sharing vectors; with this, 1692 beta chains results in 2100 unique clones
share_alph <- c(.816, .085, .021, .007, .033, .005, .033)
share_beta <- c(.859, .076, .037, .019, .009)

# Creating a population of 2100 clones with specified sharing and
# 30% dual-alpha clones and 6% dual-beta clones
set.seed(258)   # reproducibility for the vignette
TCR_pairings <- create_clones(numb_beta = 1787,
                              dual_beta = 0.06,
                              dual_alpha = 0.3,
                              alpha_sharing = share_alph,
                              beta_sharing = share_beta)
TCR_clones <- TCR_pairings$TCR

## ------------------------------------------------------------------------
# 5 plates (= 480 wells), every well has a sample size of 50 cells
numb_cells <- matrix(c(50, 480), ncol = 2)

# 1 plate (= 96 wells), 48 wells with 100 cells/well, 48 wells with 200 cells/well
numb_cells <- matrix(c(100, 200, 48, 48), ncol = 2)

## ------------------------------------------------------------------------
# Different experimental parameters
number_plates <- 5        # five 96-well plates
err_drop <- c(0.15, .01)  # drop error rate distribution ~ lognormal(.15, .1)
err_seq  <- c(0.02, .005) # in frame error rate dist ~ lognormal(.02, .005)
err_mode <- c("constant", "constant") # lognormal error distributions
number_skewed <- 25       # 25 clones representing the top proportion of population
pct_top <- 0.5            # top of population represents 50% of population
dis_behavior <- "linear"  # only option avaiable is linear at the moment

# Mixed sampling strategy: 128 wells of 20 cells/well, 64 wells of 50 cells/well,
# 96 wells of 100 cells/well, 200 cells/well, 300 cells/well each
numb_cells <- matrix(c(20,  50, 100, 200, 300,
                       128, 64,  96,  96,  96), ncol = 2)

# Creating the data sets
data_tcr <- create_data(TCR = TCR_clones,
                        plates = number_plates,
                        error_drop = err_drop,
                        error_seq = err_seq,
                        error_mode = err_mode,
                        skewed = number_skewed,
                        prop_top = pct_top,
                        dist = dis_behavior,
                        numb_cells = numb_cells)

# Saving the data for alpha chains and data for beta chains
data_alph <- data_tcr$alpha
data_beta <- data_tcr$beta

## ------------------------------------------------------------------------
# Normally you would want to set rep = 100 or more
pairs <- bagpipe(alpha = data_alph, beta = data_beta, rep = 5)

## ------------------------------------------------------------------------
head(pairs)

## ------------------------------------------------------------------------
# remove candidate pairs that don't appear in more than 30% of replicates
pairs <- pairs[pairs[, "prop_replicates"] > .3, ]
head(pairs)

## ------------------------------------------------------------------------
freq_init <- freq_estimate(alpha = data_alph,
                           beta = data_beta,
                           pair = pairs,
                           error = 0.15,
                           numb_cells = numb_cells)
head(freq_init)

## ------------------------------------------------------------------------
# determining duals in the top; note the use of the error rate
common_dual <- dual_top(alpha = data_alph,
                        beta = data_beta,
                        pair = freq_init,
                        error = err,
                        numb_cells = numb_cells)

# determining duals in the tail; note that this does NOT use the error rate
tail_dual <- dual_tail(alpha = data_alph,
                       beta = data_beta,
                       freq_results = freq_init,
                       numb_cells = numb_cells)

## ------------------------------------------------------------------------
clones_dual <- rbind(common_dual, tail_dual)
head(clones_dual)

## ------------------------------------------------------------------------
# Find the frequencies of the newly identified dual clones
freq_dual <- freq_estimate(alpha = data_alph,
                           beta = data_beta,
                           pair = clones_dual,
                           error = 0.15,
                           numb_cells = numb_cells)

# Remove the candidate beta-sharing clones and replace with the dual clones
tcrpairs <- combine_freq_results(freq_init, freq_dual)

## ------------------------------------------------------------------------
head(tcrpairs)

## ------------------------------------------------------------------------
dual_res <- dual_eval(duals = clones_dual,
                      pair = freq_init,
                      TCR = TCR_pairings$TCR,
                      number_skewed = number_skewed,
                      TCR_dual = TCR_pairings$dual_alpha)

# listing the false dual rate and the adjusted dual depths of the top and tail clones
dual_res$fdr
dual_res$adj_depth_top
dual_res$adj_depth_tail

## ------------------------------------------------------------------------
freq_res <- freq_eval(freq = tcrpairs,
                      number_skewed = number_skewed,
                      TCR = TCR_pairings$TCR,
                      numb_clones = nrow(TCR_pairings$TCR),
                      prop_top = pct_top)

# CV of estimates and the proportion of CIs with correct frequency
freq_res$cv
freq_res$correct

