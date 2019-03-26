library(binMto)


### Name: binMto
### Title: Confidence intervals for many-to-one comparisons of proportions
### Aliases: binMto binMto.default binMto.formula
### Keywords: htest

### ** Examples


# 1)Simultaneous CI for Dunnett contrasts for
# the example in Table 1 of Bretz F and Hothorn LA (2002):
#  Detecting dose-response using contrasts: asymptotic
#  power and sample size determination for binomial data.
#  Statistics in Medicine 21, 3325-3335.

binMto(x=c(9,19,21,21,24),
 n=c(20,43,42,42,41),
 names = c("Placebo", 0.125, 0.5, 0.75, 1) )

#########################################################

# 2) Berth-Jones, J., Todd, G., Hutchinson, P.E.,
# Thestrup-Pedersen, K., Vanhoutte, F.P. (2000):
# Treatment of Psoriasis with oral liarozole:
# a dose-ranging study.
# British Journal of Dermatology 143 (6), 1170-1176.

# Three doses of a compound (liarozole) were compared
# to a group treated with placebo. The primary variable
# was defined as the proportion of patients with an at
# least marked improvement of psoriasis symptoms. 
# A total of 139 patients were assigned to the 4 treatment
# groups, sample sizes were 34,35,36,34, for the Placebo,
# 50mg, 75mg, and 150mg treatments, respectively.
# The number of patients with marked improvement of
# symptoms was 2,6,4,13 in the 4 treatment groups.

# two-sided Add-4 95-percent confidence intervals:

binMto(x=c(2,6,4,13),
 n=c(34,35,36,34),
 names = c("Placebo","50mg","75mg","150mg") )





