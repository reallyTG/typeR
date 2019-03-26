library(SensitivityCaseControl)


### Name: sens.analysis.mh
### Title: Sensitivity Analysis for Mantel-Haenszel test
### Aliases: sens.analysis.mh

### ** Examples

# Data from narrow cases in Table 1 of Small, Cheng and Halloran, Rosenbaum
cases.exposed=c(rep(0,174+60+14+4+0),rep(1,34+19+6+1+0));
referents.exposed=c(rep(0,174),rep(1,60),rep(2,14),rep(3,4),rep(0,34),rep(1,19),rep(2,6),rep(3,1));
no.referents=rep(4,312);
# Sensitivity analysis for Mantel-Haenszel statistic at Gamma=1.2
sens.analysis.mh(cases.exposed,referents.exposed,no.referents,Gamma=1.2);



