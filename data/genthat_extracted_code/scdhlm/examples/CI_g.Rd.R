library(scdhlm)


### Name: CI_g
### Title: Approximate confidence interval for BC-SMD effect size estimates
### Aliases: CI_g

### ** Examples

data(Laski)
Laski_RML <- lme(fixed = outcome ~ treatment,
                 random = ~ 1 | case, 
                 correlation = corAR1(0, ~ time | case), 
                 data = Laski)
Laski_g <- g_REML(Laski_RML, p_const = c(0,1), 
                  r_const = c(1,0,1), returnModel=FALSE)
CI_g(Laski_g)

Laski_HPS <- with(Laski, effect_size_MB(outcome, treatment, case, time))
CI_g(Laski_HPS)




