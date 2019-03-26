library(plm)


### Name: ranef.plm
### Title: Extract the Random Effects
### Aliases: ranef.plm ranef
### Keywords: regression

### ** Examples

data("Grunfeld", package = "plm")
m1 <- plm(inv ~ value + capital, data = Grunfeld, model = "random")
ranef(m1) # individual random effects

# compare to random effects by ML estimation via lmer from package lme4
## Not run: 
##D   library(lme4)
##D   m2 <- lmer(inv ~ value + capital + (1 | firm), data = Grunfeld) 
##D   cbind("plm" = ranef(m1), "lmer" = unname(ranef(m2)$firm))
## End(Not run)

# two-ways RE model, calculate individual and time random effects
data("Cigar", package = "plm")
tw <- plm(sales ~ pop + price, data = Cigar, model = "random", effect = "twoways")
ranef(tw)                   # individual random effects
ranef(tw, effect = "time")  # time random effects




