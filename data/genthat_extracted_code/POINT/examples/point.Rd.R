library(POINT)


### Name: point
### Title: Protein Structure Guided Local Test
### Aliases: point

### ** Examples


  # number of subjects
  nsubj <- 1000

  # number of markers
  nm <- 5

  # generate coordinates for proteins
  protein <- cbind( stats::rnorm(n = nm, mean = 17.6, sd =  6.6),
                    stats::rnorm(n = nm, mean =  1.6, sd = 13.6),
                    stats::rnorm(n = nm, mean = 22.9, sd = 10.4) )

  # generate snp matrix
  snp <- matrix(data = rbinom(n = nsubj*nm, size = 1, p = 0.02), 
                nrow = nsubj, ncol = nm)
  colnames(snp) = paste0("m",1:nm)

  # generate binmoial response
  MAF <- colMeans(x = snp)/2
  causal <- numeric(nm)
  causal[c(2,4)] <- 1.0
  betaG <- 0.4*abs(log10(x = MAF))*causal

  #no non-genetic covariates
  X <- NULL
  mu <- -0.05 + snp %*% betaG

  pryy <- exp(mu)/(1+exp(mu))
  yy <- sapply(X = pryy, FUN = stats::rbinom, n = 1, size = 1)

  res <- point(yy = yy, X = X, snp = snp, proteinCoord = protein,
               trait = 'binomial', cValues = c(0.1,0.2),
               weighted = TRUE, weight = NULL, kernel = 'linear',
               pvMethod = 'liu', nperturb = 100,
               verbose = FALSE)




