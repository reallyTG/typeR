library(iopsych)


### Name: aiPuxComposite
### Title: Estimate ai and average criterion scores for majority and
###   minority groups.
### Aliases: aiPuxComposite

### ** Examples

# Example taken from De Corte, W. (2003)
R <- matrix(c(1.000, 0.170, 0.000, 0.100, 0.290, 0.160, 
              0.170, 1.000, 0.120, 0.160, 0.300, 0.260, 
              0.000, 0.120, 1.000, 0.470, 0.120, 0.200, 
              0.100, 0.160, 0.470, 1.000, 0.240, 0.250, 
              0.290, 0.300, 0.120, 0.240, 1.000, 0.170, 
              0.160, 0.260, 0.200, 0.250, 0.170, 1.000), 6, 6)

wt_x <- c(.244, .270, .039, .206) 
wt_y <- c(6, 2)
sr    <- 0.25
pct_minority <- .20

# Note that the d-values are reversed from what the CAIQS manual reports (see pg 4)
dX   <- c(1, 0.09, 0.09, 0.20)
dY   <- c(0.450, 0.0)

aiPuxComposite(R, 5:6, 1:4, dX, dY, wt_x, wt_y, sr, pct_minority)

# compare the output from predictAI with the output in the CAIQS manual on page 7 where SR = .250




