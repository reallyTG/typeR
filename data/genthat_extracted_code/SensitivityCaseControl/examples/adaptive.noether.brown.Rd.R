library(SensitivityCaseControl)


### Name: adaptive.noether.brown
### Title: Adaptive test for observational studies that adapts between
###   Noether's and Brown's test statistics
### Aliases: adaptive.noether.brown

### ** Examples

# Data on volume of hippocampus in 15 sets of twins in which one twin is affected by schizophrenia
# and one twin is not (data from R.L. Suddath et al., "Anatomical Abnormalities in the Brains of 
# Monozygotic Twins Discordant for Schizophrenia," New England Journal of Medicine 322, 1990
# pp. 789-93.  Data taken from the Statistical Sleuth, F.L. Ramsey and D.W. Schafer
unaffected=c(1.94,1.44,1.56,1.58,2.06,1.66,1.75,1.77,1.78,1.92,1.25,1.93,2.04,1.62,2.08)
affected=c(1.27,16.3,1.47,1.39,1.93,1.26,1.71,1.67,1.28,1.85,1.02,1.34,2.02,1.59,1.97)
difference=unaffected-affected
adaptive.noether.brown(difference,Gamma=1.1)
# The null hypothesis of no treatment is rejected for Gamma=1.13 but not for Gamma=1.14



