library(esc)


### Name: hedges_g
### Title: Convert effect sizes
### Aliases: hedges_g eta_squared cohens_f cohens_d pearsons_r log_odds
###   odds_ratio

### ** Examples

# convert from d to Hedges' g or odds ratio
hedges_g(d = 0.75, totaln = 50)
odds_ratio(d = .3)

# convert from odds ratio to eta_squared
eta_squared(or = 2.3)

# convert from f or r to d
cohens_d(f = .3)
cohens_d(r = .25)

# functions are vectorized
hedges_g(c(0.75, .3), c(50, 70))
cohens_f(r = c(.1, .2, .3))




