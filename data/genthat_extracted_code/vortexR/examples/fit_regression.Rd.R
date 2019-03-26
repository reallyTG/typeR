library(vortexR)


### Name: fit_regression
### Title: Search for the best regression model(s)
### Aliases: fit_regression

### ** Examples

# Using Pacioni et al. example data. See ?pac.run.lhs and ?pac.lhs for more
# details.
data(pac.run.lhs, pac.lhs)

# Remove base scenario from .stdat data
pac.lhs.no.base <- pac.lhs[!pac.lhs$scen.name == 'ST_LHS(Base)', ]

# Use function lookup_table to obtain correct parameter values at year 0
lkup.ST_LHS <- lookup_table(data=pac.lhs.no.base, project='Pacioni_et_al',
                            scenario='ST_LHS',
                            pop='Population 1',
                            SVs=c('SV1', 'SV2', 'SV3', 'SV4', 'SV5', 'SV6', 'SV7'),
                            save2disk=FALSE)

# Remove base scenario from .run output in long format
lrun.ST_LHS.no.base <- pac.run.lhs[[2]][!pac.run.lhs[[2]]$Scenario == 'ST_LHS(Base)', ]

reg <- fit_regression(data=lrun.ST_LHS.no.base, lookup=lkup.ST_LHS,
                      census=FALSE,
                      project='Pacioni_et_al', scenario='ST_LHS', popn=1,
                      param='N', vs=c('SV1', 'SV2', 'SV3'), l=2,  ncand=30,
                      save2disk=FALSE)

 # Clean up of residual files written by glmulti
 # Note, in some OS (W) these files may be locked because in use by R and have
 # to be manually after the R session has been either terminated or restarted
 file.remove(c('Pacioni_et_al_ST_LHS_N.modgen.back',
               'Pacioni_et_al_ST_LHS_N.mods.back'))

# Example of information you can obtained once you have run fit_regression

# The formula for the best model
bestmodel <- reg@formulas[1]

# The formulae for the best 30 model
bestmodels <- reg@formulas

# List of IC values
qaicvalues <- reg@crits

# QAIC differences between the first 5 best models (stored in 'delta')
delta <- as.vector(NULL)
for (i in 1:5) {
  del <- qaicvalues[i+1] - qaicvalues[i]
  delta <- c(delta, del)
}

# The best model's coefficients
coef.best <- coef(reg@objects[[1]])

# The model averaged coefficients
coef.all <- glmulti::coef.glmulti(reg)
coefs <- data.frame(Estimate=coef.all[,1],
                    Lower=coef.all[,1] - coef.all[,5],
                    Upper=coef.all[,1] + coef.all[,5])

# Plot IC profile
plot(reg, type='p')

# Plot of model averaged importance of terms
plot(reg, type='s')



