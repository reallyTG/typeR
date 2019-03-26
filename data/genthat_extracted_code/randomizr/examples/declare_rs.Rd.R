library(randomizr)


### Name: declare_rs
### Title: Declare a random sampling procedure.
### Aliases: declare_rs

### ** Examples

# The declare_rs function is used in three ways:

# 1. To obtain some basic facts about a sampling procedure:
declaration <- declare_rs(N = 100, n = 30)
declaration

# 2. To draw a random sample:

S <- draw_rs(declaration)
table(S)

# 3. To obtain inclusion probabilities

probs <- obtain_inclusion_probabilities(declaration)
table(probs, S)

# Simple Random Sampling Declarations

declare_rs(N = 100, simple = TRUE)
declare_rs(N = 100, prob = .4, simple = TRUE)

# Complete Random Sampling Declarations

declare_rs(N = 100)
declare_rs(N = 100, n = 30)

# Stratified Random Sampling Declarations

strata <- rep(c("A", "B","C"), times=c(50, 100, 200))
declare_rs(strata = strata)
declare_rs(strata = strata, prob = .5)


# Cluster Random Sampling Declarations

clusters <- rep(letters, times = 1:26)
declare_rs(clusters = clusters)
declare_rs(clusters = clusters, n = 10)

# Stratified and Clustered Random Sampling Declarations

clusters <- rep(letters, times = 1:26)
strata <- rep(NA, length(clusters))
strata[clusters %in% letters[1:5]] <- "stratum_1"
strata[clusters %in% letters[6:10]] <- "stratum_2"
strata[clusters %in% letters[11:15]] <- "stratum_3"
strata[clusters %in% letters[16:20]] <- "stratum_4"
strata[clusters %in% letters[21:26]] <- "stratum_5"

table(strata, clusters)

declare_rs(clusters = clusters, strata = strata)
declare_rs(clusters = clusters, strata = strata, prob = .3)




