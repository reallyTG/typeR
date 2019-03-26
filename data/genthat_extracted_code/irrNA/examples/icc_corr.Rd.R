library(irrNA)


### Name: icc_corr
### Title: Intraclass correlation coefficients (ICCs) for oneway and twoway
###   models - corrected version of icc{irr}
### Aliases: icc_corr

### ** Examples

# Example 1:
data(EbelFILL)
# EbelFILL is a rather arbitrary data set:
EbelFILL
# If twoway agreement ICCs are computed (e.g. the single 
# measure) with icc{irr}, the 2nd df of F and thus the 
# p-value is erroneous:
library(irr)
icc(EbelFILL, model="twoway", type="agreement")
# icc_corr calculates correctly: 
icc_corr(EbelFILL, model="twoway", type="agreement")
# 
# Example 2:
data(Consist)
# Consist exhibits a perfect consistency and 
# a moderate absolute agreement between raters:
Consist
# If twoway ICCs are computed with icc{irr}, the F-value is smaller
# than zero (!) and thus the p-value is enourmously erroneous:
library(irr)
icc(Consist, model="twoway", type="consistency", unit="average")
# icc_corr calculates correctly: 
icc_corr(Consist, model="twoway", type="consistency", unit="average")
#
# Example 3:
data(Indep)
# Indep exhibits zero variance between the raters just as 
# well as between the objects:
Indep
# Errors occur, if twoway agreement ICCs are computed with icc{irr}:
# ICC(A,k) just as well as its CI-bounds are (falsely) positive 
# and greater than 1...
icc(Indep, model="twoway", type="agreement", unit="average")
# ...but must be -Inf, just as icc_corr shows:
icc_corr(Indep, model="twoway", type="agreement", unit="average")
# ICC(A,1): 2nd df of F and thus the p-value are NaN
icc(Indep, model="twoway", type="agreement")
# icc_corr calculates correlctly:
icc_corr(Indep, model="twoway", type="agreement")



