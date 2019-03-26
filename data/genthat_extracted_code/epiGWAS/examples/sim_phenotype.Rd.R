library(epiGWAS)


### Name: sim_phenotype
### Title: Simulates a binary phenotype
### Aliases: sim_phenotype

### ** Examples

nX <- 5
nY <- 3
nZ12 <- 2
clusters <- rep(seq_len(25), each = 3)
names(clusters) <- paste0("SNP_", seq_along(clusters))
MAF <- runif(length(clusters), min = 0.2, max = 0.5)

n_samples <- 3
X <- matrix((runif(n_samples * length(clusters)) < 0.4) +
            (runif(n_samples * length(clusters)) < 0.4),
            ncol = length(clusters), nrow = n_samples)

colnames(X) <- names(clusters)

causal <- sample_SNP(
 nX, nY, nZ12, clusters, MAF, thresh_MAF = 0.2, window_size = 2,
 overlap_inter = 0)
model <- gen_model(nX, nY, nZ12, mean = rnorm(4), sd = rep(1, 4))
Y <- sim_phenotype(X, causal, model, intercept = TRUE)




