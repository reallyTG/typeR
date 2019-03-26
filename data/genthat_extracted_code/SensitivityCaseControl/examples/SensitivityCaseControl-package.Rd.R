library(SensitivityCaseControl)


### Name: SensitivityCaseControl-package
### Title: Sensitivity Analysis for Case-Control Studies
### Aliases: SensitivityCaseControl-package SensitivityCaseControl
### Keywords: package

### ** Examples

# Adaptive test for a case-control study based on Table 4 in Small, Cheng, 
# Halloran and Rosenbaum (2013)
no.exposed.in.matched.set=c(rep(0,229),rep(1,23),rep(1,51),rep(2,9),rep(0,373),rep(1,46),rep(1,50),
rep(2,13));
narrowcase=c(rep(1,312),rep(0,482));
case.exposed=c(rep(0,229),rep(0,23),rep(1,51),rep(1,9),rep(0,373),rep(0,46),rep(1,50),rep(1,13));
size.matched.set=rep(2,length(case.exposed))
# Test using the statistics T1 and T1+T2 where T1 is Mantel-Haenszel for narrow cases and T2 is 
# Mantel Haenszel for marginal cases
adaptive.case.test(no.exposed.in.matched.set,narrowcase,case.exposed,size.matched.set,Gamma=1.37,
alpha=.05,narrowmultiplier=1)
# Test using the statistics T1 and 2*T1+T2
adaptive.case.test(no.exposed.in.matched.set,narrowcase,case.exposed,size.matched.set,Gamma=1.37,
alpha=.05,narrowmultiplier=2)

# Sensitivity analysis using only the narrow cases and the Mantel-Haenszel statistic
# Data from narrow cases in Table 1 of Small, Cheng and Halloran, Rosenbaum
cases.exposed=c(rep(0,174+60+14+4+0),rep(1,34+19+6+1+0));
referents.exposed=c(rep(0,174),rep(1,60),rep(2,14),rep(3,4),rep(0,34),rep(1,19),rep(2,6),rep(3,1));
no.referents=rep(4,312);
# Sensitivity analysis for Mantel-Haenszel statistic at Gamma=1.2
sens.analysis.mh(cases.exposed,referents.exposed,no.referents,Gamma=1.2);

# Adaptive test using Noether's and Brown's statstics for a matched cohort study
# Data on volume of hippocampus in 15 sets of twins in which one twin is affected by schizophrenia 
# and one twin is not (data from R.L. Suddath et al., "Anatomical Abnormalities in the Brains of 
# Monozygotic Twins Discordant for Schizophrenia," New England Journal of Medicine 322, 1990
# pp. 789-93.  Data taken from the Statistical Sleuth, F.L. Ramsey and D.W. Schafer
unaffected=c(1.94,1.44,1.56,1.58,2.06,1.66,1.75,1.77,1.78,1.92,1.25,1.93,2.04,1.62,2.08)
affected=c(1.27,16.3,1.47,1.39,1.93,1.26,1.71,1.67,1.28,1.85,1.02,1.34,2.02,1.59,1.97)
difference=unaffected-affected
adaptive.noether.brown(difference,Gamma=1.1)
# The null hypothesis of no treatment is rejected for Gamma=1.13 but not for Gamma=1.14



