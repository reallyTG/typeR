library(EnvStats)


### Name: ciBinomHalfWidth
### Title: Half-Width of Confidence Interval for Binomial Proportion or
###   Difference Between Two Proportions
### Aliases: ciBinomHalfWidth
### Keywords: design distribution htest

### ** Examples

  # Look at how the half-width of a one-sample confidence interval 
  # decreases with sample size:

  ciBinomHalfWidth(n.or.n1 = c(10, 50, 100, 500))
  #$half.width
  #[1] 0.26340691 0.13355486 0.09616847 0.04365873
  #
  #$n
  #[1]  10  50 100 500
  #
  #$p.hat
  #[1] 0.5 0.5 0.5 0.5
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #----------------------------------------------------------------

  # Look at how the half-width of a one-sample confidence interval 
  # tends to decrease as the estimated value of p decreases below 
  # 0.5 or increases above 0.5:

  seq(0.2, 0.8, by = 0.1) 
  #[1] 0.2 0.3 0.4 0.5 0.6 0.7 0.8 

  ciBinomHalfWidth(n.or.n1 = 30, p.hat = seq(0.2, 0.8, by = 0.1)) 
  #$half.width
  #[1] 0.1536299 0.1707256 0.1801322 0.1684587 0.1801322 0.1707256 
  #[7] 0.1536299
  #
  #$n
  #[1] 30 30 30 30 30 30 30
  #
  #$p.hat
  #[1] 0.2 0.3 0.4 0.5 0.6 0.7 0.8
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #----------------------------------------------------------------

  # Look at how the half-width of a one-sample confidence interval 
  # increases with increasing confidence level:

  ciBinomHalfWidth(n.or.n1 = 20, conf.level = c(0.8, 0.9, 0.95, 0.99)) 
  #$half.width
  #[1] 0.1377380 0.1725962 0.2007020 0.2495523
  #
  #$n
  #[1] 20 20 20 20
  #
  #$p.hat
  #[1] 0.5 0.5 0.5 0.5
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"

  #----------------------------------------------------------------

  # Compare the half-widths for a one-sample 
  # confidence interval based on the different methods:

  ciBinomHalfWidth(n.or.n1 = 30, ci.method = "score")$half.width
  #[1] 0.1684587

  ciBinomHalfWidth(n.or.n1 = 30, ci.method = "exact")$half.width
  #[1] 0.1870297
 
  ciBinomHalfWidth(n.or.n1 = 30, ci.method = "adjusted Wald")$half.width
  #[1] 0.1684587

  ciBinomHalfWidth(n.or.n1 = 30, ci.method = "Wald")$half.width
  #[1] 0.1955861

  #----------------------------------------------------------------

  # Look at how the half-width of a two-sample 
  # confidence interval decreases with increasing 
  # sample sizes:

  ciBinomHalfWidth(n.or.n1 = c(10, 50, 100, 500), sample.type = "two")
  #$half.width
  #[1] 0.53385652 0.21402654 0.14719748 0.06335658
  #
  #$n1
  #[1]  10  50 100 500
  #
  #$p1.hat
  #[1] 0.5 0.5 0.5 0.5
  #
  #$n2
  #[1]  10  50 100 500
  #
  #$p2.hat
  #[1] 0.4 0.4 0.4 0.4
  #
  #$method
  #[1] "Score normal approximation, with continuity correction"



