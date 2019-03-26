library(CompareTests)


### Name: CompareTests
### Title: Correct for Verification Bias in Diagnostic Accuracy & Agreement
### Aliases: CompareTests
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

##
# Stat Med Paper 2x2 Chlamydia testing verification bias example
# Note that p for symmetry test is 0.12 not 0.02 as reported in the Stat Med paper
##

# Convert 2x2 Chlamydia testing table to a dataframe for analysis
# Include NAs for the samples where CTDT test was not conducted (HC2 was conducted on all)
HC2stdtest <- c(rep(1,827),rep(0,4998))
stratum <- HC2stdtest
CTDTsampledtest <- c(           rep(1,800), # 1,1 cell
                                rep(0,27), # 1,0 cell HC2+ , CTDT-
                                rep(NA,827-800-27), # HC2+, and no CTDT test done
                                rep(1,6), # 0,1 cell: HC2-, CTDT+
                                rep(0,396),# 0,0 cell: HC2- and CTDT-
                                rep(NA,4998-6-396) # HC2-, no CTDT test done
)
chlamydia <- data.frame(stratum,HC2stdtest,CTDTsampledtest)					

# Analysis
temp <- CompareTests(chlamydia$HC2stdtest,
                     chlamydia$CTDTsampledtest,
                     chlamydia$stratum,
                     goldstd="sampledtest"
)


##
# Example analysis of fictitious data example
##
data(specimens)
temp <- CompareTests(specimens$stdtest,
                     specimens$sampledtest,
                     specimens$stratum,
                     goldstd="sampledtest")
## The output is
# The weighted contingency table:
#                             as.factor.stdtest.
# as.factor.sampledtest.     1       2      3      4
#                      1 47.88   7.158  3.322  0.000
#                      2 20.12 104.006 21.861  2.682
#                      3  0.00  10.836 97.494  8.823
#                      4  0.00   0.000  3.322 74.495
# 
# 
# Agreement Statistics
# 
# pct agree and 95% CI: 0.8057 ( 0.7438 0.8555 )
# pct agree by categories and 95% CI 
#      est   left  right
# 1 0.6101 0.4501 0.7494
# 2 0.6241 0.5315 0.7083
# 3 0.6693 0.5562 0.7658
# 4 0.8340 0.6340 0.9358
# Kappa and 95% CI: 0.734 ( 0.6509 0.8032 )
# Weighted Kappa (quadratic weights) and 95% CI: 0.8767 ( 0.7107 0.9536 )
# symmetry chi-square: 9.119 p= 0.167 
# 
# 
# 
# Diagnostic Accuracy statistics
# 
#        est   left  right
# 1PV 0.7041 0.5422 0.8271
# 2PV 0.8525 0.7362 0.9229
# 3PV 0.7738 0.6547 0.8605
# 4PV 0.8662 0.6928 0.9490
#          est   left  right
# 1CSCP 0.8204 0.6011 0.9327
# 2CSCP 0.6996 0.6169 0.7710
# 3CSCP 0.8322 0.7219 0.9046
# 4CSCP 0.9573 0.5605 0.9975



