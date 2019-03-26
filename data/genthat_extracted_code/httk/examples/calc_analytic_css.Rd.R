library(httk)


### Name: calc_analytic_css
### Title: Calculate the analytic steady state concentration.
### Aliases: calc_analytic_css
### Keywords: Solve

### ** Examples

calc_analytic_css(chem.name='Bisphenol-A',output.units='mg/L',
                  model='3compartment',concentration='blood')
calc_analytic_css(chem.name='Bisphenol-A',tissue='liver',species='rabbit',
                  default.to.human=TRUE,daily.dose=2)



