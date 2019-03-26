library(lm.br)


### Name: 'lm.br'
### Title: Fit a Linear Model with a Breakpoint
### Aliases: lm.br-package lm.br print.lm.br
### Keywords: package

### ** Examples

#  Smith & Cook (1980), "Straight Lines with a Change-point: A Bayesian
#  Analysis of some Renal Transplant Data", Appl Stat, *29*, 180-189,  
#  reciprocal of blood creatinine L/micromol  vs  day after transplant.
creatinine <- c(37.3, 47.1, 51.5, 67.6, 75.9, 73.3, 69.4, 61.5, 31.8, 19.4)
day <- 1:10
sc <- lm.br( creatinine ~ day )
sc $ mle()
sc $ ci()
sc $ sl( day[1] - 1.5 )      # test for the presence of a changepoint
plot( sc$residuals )


#  A 'TL' example, data from figure 1 in Chiu et al. (2006), "Bent-cable
#  regression theory and applications", J Am Stat Assoc, *101*, 542-553,
#  log(salmon abundance) vs year.
salmon <- c( 2.50, 2.93, 2.94, 2.83, 2.43, 2.84, 3.06, 2.97, 2.94, 2.65,
  2.92, 2.71, 2.93, 2.60, 2.12, 2.08, 1.81, 2.45, 1.71, 0.55, 1.30 )
year <- 1980 : 2000
chiu <- lm.br( salmon ~ year, 'tl' )
chiu $ ci()


#  A multiple regression example, using an R dataset,
#  automobile miles-per-gallon  versus  weight and horsepower.
lm.br( mpg ~ wt + hp,  data = mtcars )


#  An example with variance known, for the Normal approximations of binomial
#  random variables using formula 2.28 of Cox and Snell (1989).
#    Ex. 3.4 of Freeman (2010) "Inference for binomial changepoint data" in
# _Advances in Data Analysis_, ed. C Skiadas, Boston: Birkhauser, 345-352.
trials <- c( 15, 82, 82, 77, 38, 81, 12, 97, 33, 75,
  85, 37, 44, 96, 76, 26, 91, 47, 41, 35 )
successes <- c( 8, 44, 47, 39, 24, 38, 3, 51, 16, 43,
  47, 27, 33, 64, 41, 18, 61, 32, 33, 24 )
log_odds <- log( (successes - 0.5)/(trials - successes - 0.5) )
variances <- (trials-1)/( successes*(trials-successes) )
group <- 1 : 20
lm.br( log_odds ~ group, 'TL', w= variances, inv= TRUE, var.known= TRUE )


#  An example that shows different confidence regions from inference by
#  conditional likelihood-ratio (CLR)  versus  approximate-F (AF).
y <- c( 1.6, 3.2, 6.3, 4.8, 4.3, 4.0, 3.5, 1.8 )
x <- 1:8
eg <- lm.br( y ~ x )
## No test: 
eg$cr( output='t' )
## End(No test)
eg$cr( method = 'aF', output='t' )



