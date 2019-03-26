library(CreditMetrics)


### Name: cm.val
### Title: Valuation for the credit positions of each scenario
### Aliases: cm.val
### Keywords: models

### ** Examples

  N <- 3
  n <- 50000
  r <- 0.03
  ead <- c(4000000, 1000000, 10000000)
  lgd <- 0.45
  rating <- c("BBB", "AA", "B")
  firmnames <- c("firm 1", "firm 2", "firm 3")
  
  # correlation matrix
  rho <- matrix(c(  1, 0.4, 0.6,
                  0.4,   1, 0.5,
                  0.6, 0.5,   1), 3, 3, dimnames = list(firmnames, firmnames),
                  byrow = TRUE)

  # one year empirical migration matrix from standard&poors website
  rc <- c("AAA", "AA", "A", "BBB", "BB", "B", "CCC", "D")
  M <- matrix(c(90.81,  8.33,  0.68,  0.06,  0.08,  0.02,  0.01,   0.01,
                 0.70, 90.65,  7.79,  0.64,  0.06,  0.13,  0.02,   0.01,
                 0.09,  2.27, 91.05,  5.52,  0.74,  0.26,  0.01,   0.06,
                 0.02,  0.33,  5.95, 85.93,  5.30,  1.17,  1.12,   0.18,
                 0.03,  0.14,  0.67,  7.73, 80.53,  8.84,  1.00,   1.06,
                 0.01,  0.11,  0.24,  0.43,  6.48, 83.46,  4.07,   5.20,
                 0.21,     0,  0.22,  1.30,  2.38, 11.24, 64.86,  19.79,
                    0,     0,     0,     0,     0,     0,     0, 100
              )/100, 8, 8, dimnames = list(rc, rc), byrow = TRUE)

  cm.val(M, lgd, ead, N, n, r, rho, rating)



