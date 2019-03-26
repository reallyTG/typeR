library(sortinghat)


### Name: simdata_guo
### Title: Generates data from 'K' multivariate normal data populations
###   having the covariance structure from Guo et al. (2007).
### Aliases: simdata_guo

### ** Examples

# Generates 10 observations from two multivariate normal populations having
# a block-diagonal autocorrelation structure.
block_size <- 3
num_blocks <- 3
p <- block_size * num_blocks
means_list <- list(seq_len(p), -seq_len(p))
data <- simdata_guo(n = c(10, 10), mean = means_list, block_size = block_size,
                    num_blocks = num_blocks, rho = 0.9, seed = 42)
dim(data$x)
table(data$y)

# Generates 15 observations from each of three multivariate normal
# populations having block-diagonal autocorrelation structures. The
# covariance matrices are unequal.
p <- 16
block_size <- c(2, 4, 8)
num_blocks <- p / block_size
rho <- c(0.1, 0.5, 0.9)
sigma2 <- 1:3
mean_list <- list(rep.int(-5, p), rep.int(0, p), rep.int(5, p))

set.seed(42)
data2 <- simdata_guo(n = c(15, 15, 15), mean = mean_list,
                    block_size = block_size, num_blocks = num_blocks,
                    rho = rho, sigma2 = sigma2)
dim(data2$x)
table(data2$y)



