library(DirectEffects)


### Name: sequential_g
### Title: Perform linear sequential g-estimation to estimate the
###   controlled direct effect of a treatment net the effect of a mediator.
### Aliases: sequential_g

### ** Examples

data(ploughs)

form_main <- women_politics ~ plow +
  agricultural_suitability + tropical_climate + large_animals +
  political_hierarchies + economic_complexity +
  rugged | years_civil_conflict +
  years_interstate_conflict  + oil_pc +
  european_descent + communist_dummy + polity2_2000 +
  serv_va_gdp2000 | centered_ln_inc + centered_ln_incsq

direct <- sequential_g(form_main, ploughs)

summary(direct)



