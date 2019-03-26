library(DirectEffects)


### Name: boots_g
### Title: Coefficient Estimates across Bootstrapped Samples
### Aliases: boots_g

### ** Examples

## No test: 
data(ploughs)
form <- women_politics ~ plow +
 agricultural_suitability + tropical_climate + large_animals + rugged |
 years_civil_conflict + years_interstate_conflict  + oil_pc +
 european_descent + communist_dummy + polity2_2000 |
 centered_ln_inc + centered_ln_incsq
s1 <- sequential_g(form, ploughs)

out.boots <- boots_g(s1)

summary(out.boots)
## End(No test)



