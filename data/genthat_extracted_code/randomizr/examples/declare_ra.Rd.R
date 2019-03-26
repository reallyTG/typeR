library(randomizr)


### Name: declare_ra
### Title: Declare a random assignment procedure.
### Aliases: declare_ra

### ** Examples

# The declare_ra function is used in three ways:

# 1. To obtain some basic facts about a randomization:
declaration <- declare_ra(N=100, m_each=c(30, 30, 40))
declaration

# 2. To conduct a random assignment:

Z <- conduct_ra(declaration)
table(Z)

# 3. To obtain observed condition probabilities

probs <- obtain_condition_probabilities(declaration, Z)
table(probs, Z)

# Simple Random Assignment Declarations

declare_ra(N=100, simple = TRUE)
declare_ra(N=100, prob = .4, simple = TRUE)
declare_ra(N=100, prob_each=c(0.3, 0.3, 0.4),
           conditions=c("control", "placebo", "treatment"), simple=TRUE)

# Complete Random Assignment Declarations

declare_ra(N=100)
declare_ra(N=100, m_each = c(30, 70),
           conditions = c("control", "treatment"))
declare_ra(N=100, m_each=c(30, 30, 40))


# Block Random Assignment Declarations

blocks <- rep(c("A", "B","C"), times = c(50, 100, 200))

block_m_each <- rbind(c(10, 40),
                 c(30, 70),
                 c(50, 150))
declare_ra(blocks = blocks, block_m_each = block_m_each)


# Cluster Random Assignment Declarations

clusters <- rep(letters, times = 1:26)
declare_ra(clusters = clusters)
declare_ra(clusters = clusters, m_each = c(7, 7, 12))

# Blocked and Clustered Random Assignment Declarations

clusters <- rep(letters, times=1:26)
blocks <- rep(NA, length(clusters))
blocks[clusters %in% letters[1:5]] <- "block_1"
blocks[clusters %in% letters[6:10]] <- "block_2"
blocks[clusters %in% letters[11:15]] <- "block_3"
blocks[clusters %in% letters[16:20]] <- "block_4"
blocks[clusters %in% letters[21:26]] <- "block_5"

table(blocks, clusters)

declare_ra(clusters = clusters, blocks = blocks)
declare_ra(clusters = clusters, blocks = blocks, prob_each = c(.2, .5, .3))




