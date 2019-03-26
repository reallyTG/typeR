library(rbounds)


### Name: SumTestSens
### Title: Rosenbaum Sensitivity Analysis for Unmatched Groups
### Aliases: SumTestSens

### ** Examples

## Example from Rosenbaum (2002, p.~146)
  mercury <- data.frame(matrix(c(1, 0, 2.7,    5.3,
                                 2, 0, 0.5,   15.0,
                                 3, 0, 0.0,   11.0,
                                 4, 0, 0.0,    5.8,
                                 5, 0, 5.0,   17.0,
                                 6, 0, 0.0,    7.0,
                                 7, 0, 0.0,    8.5,
                                 8, 0, 1.3,    9.4,
                                 9, 0, 0.0,    7.8,
                                10, 0, 1.8,   12.0,
                                11, 0, 0.0,    8.7,
                                12, 0, 0.0,    4.0,
                                13, 0, 1.0,    3.0,
                                14, 0, 1.8,   12.2,
                                15, 0, 0.0,    6.1,
                                16, 0, 3.1,   10.2,
                                17, 1, 0.7,  100.0,
                                18, 1, 4.6,   70.0,
                                19, 1, 0.0,  196.0,
                                20, 1, 1.7,   69.0,
                                21, 1, 5.2,  370.0,
                                22, 1, 0.0,  270.0,
                                23, 1, 5.0,  150.0,
                                24, 1, 9.5,   60.0,
                                25, 1, 2.0,  330.0,
                                26, 1, 3.0, 1100.0,
                                27, 1, 1.0,   40.0,
                                28, 1, 3.5,  100.0,
                                29, 1, 2.0,   70.0,
                                30, 1, 5.0,  150.0,
                                31, 1, 5.5,  200.0,
                                32, 1, 2.0,  304.0,
                                33, 1, 3.0,  236.0,
                                34, 1, 4.0,  178.0,
                                35, 1, 0.0,   41.0,
                                36, 1, 2.0,  120.0,
                                37, 1, 2.2,  330.0,
                                38, 1, 0.0,   62.0,
                                39, 1, 2.0,   12.8),
                               nrow = 39, ncol = 4, byrow = TRUE))
  colnames(mercury) <- c("ID", "Tr", "Pct.cu.cells", "Hg.in.blood")
  
  (T_test <- rank(mercury$Hg.in.blood) %*% mercury$Tr)
  (q_test <- sort(rank(mercury$Hg.in.blood), decreasing = TRUE))
  (n_test <- nrow(mercury))
  (m_test <- sum(mercury$Tr))

  ## Note: since this function uses exact rather than approximate
  ## formulas for the mean and variance of T, the p-values it
  ## calculates do not precisely match those in Rosenbaum (2002).

  #A single Gamma value - example not run
  #testOut2 <- SumTestSens(T = T_test,
  #                         q = q_test,
  #                         n = n_test,
  #                         m = m_test,
  #                         Gamma = 35)
 
  ## Apply to vector of Gamma values
  sapply(c(1, 5, 35), SumTestSens,
         T = T_test, q = q_test, n = n_test, m = m_test) 



