library(episensr)


### Name: confounders.evalue
### Title: Compute E-value to assess bias due to unmeasured confounder.
### Aliases: confounders.evalue

### ** Examples

# The data for this example come from:
# Victoria C.G., Smith P.G., Vaughan J.P., Nobre L.C., Lombardi C., Teixeira A.M.
# et al.
# Evidence for protection by breast-feeding against infant deaths from infectious
# diseases in Brazil.
# Lancet 1987;2:319-22.
confounders.evalue(est = 3.9, type = "RR")

# The data for this example come from:
# Oddy W.H, Smith G.J., Jacony P. 
# A possible strategy for developing a model to account for attrition bias in a
# longitudinal cohort to investigate associations between exclusive breastfeeding and
# overweight and obesity at 20 years.
# Annals of Nutrition and Metabolism 2014;65:234-235.
confounders.evalue(est = 1.47, lower_ci = 1.12, upper_ci = 1.93, type = "ORc")

# The data for this example come from:
# Reinisch J., Sanders S., Mortensen E., Rubin D.B.
# In-utero exposure to phenobarbital and intelligence deficits in adult men.
# Journal of the American Medical Association 1995;274:1518-1525
confounders.evalue(est = -0.42, sd = 0.14, type = "diff_RR")



