library(scdhlm)


### Name: Info_Expected_lmeAR1
### Title: Calculate expected information matrix
### Aliases: Info_Expected_lmeAR1

### ** Examples

data(Laski)
Laski_RML <- lme(fixed = outcome ~ treatment, 
                 random = ~ 1 | case, 
                 correlation = corAR1(0, ~ time | case), 
                 data = Laski)
Info_Expected_lmeAR1(Laski_RML)



