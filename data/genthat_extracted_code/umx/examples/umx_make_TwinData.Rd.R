library(umx)


### Name: umx_make_TwinData
### Title: Simulate twin data with control over A, C, and E parameters, as
###   well as moderation of A.
### Aliases: umx_make_TwinData

### ** Examples

# =====================================================================
# = Basic Example, with all elements of std univariate data specified =
# =====================================================================
tmp = umx_make_TwinData(nMZpairs = 10000, AA = .30, CC = .00, EE = .70)
# Show list of 2 data sets
str(tmp)
# = How to consume the built datasets =
mzData = tmp[[1]];
dzData = tmp[[2]];
cov(mzData); cov(dzData)
umxAPA(mzData)
str(mzData); str(dzData); 

# Prefer to work in path coefficient values? (little a?)
tmp = umx_make_TwinData(200, AA = .6^2, CC = .2^2)
# Check the correlations
umxAPA(tmp[[1]]); umxAPA(tmp[[2]])

# =============
# = Shortcuts =
# =============

# Omit nDZpairs (equal numbers of both by default)
tmp = umx_make_TwinData(nMZpairs = 100, nDZpairs = 100, AA = .36, CC = .04, EE = .60)
tmp = umx_make_TwinData(100, AA = 0.5, CC = 0.3) # omit any one of A, C, or E (sums to 1)
cov(tmp[[1]])
# Not limited to unit variance
tmp = umx_make_TwinData(100, AA = 3, CC = 2, EE = 3, sum2one = FALSE) 
cov(tmp[[1]])

# =====================
# = Moderator Example =
# =====================

x = umx_make_TwinData(100, AA = c(avg = .7, min = 0, max = 1), CC = .55, EE = .63)
str(x)

# =====================
# = Threshold Example =
# =====================
tmp = umx_make_TwinData(100, AA = .6, CC = .2, nThresh = 3)
str(tmp)
umxAPA(tmp[[1]]); umxAPA(tmp[[2]])


# ========================
# = Just use MZr and DZr =
# ========================
tmp = umx_make_TwinData(100, MZr = .86, DZr= .60, varNames = "IQ")
umxAPA(tmp[[1]]); umxAPA(tmp[[2]])

# Bivariate GxSES example (see umxGxEbiv)

AA   = list(a11 = .4, a12 = .1, a22 = .15)
CC   = list(c11 = .2, c12 = .1, c22 = .10)
EE   = list(e11 = .4, e12 = .3, e22 = .25)
Amod = list(Beta_a1 = .025, Beta_a2 = .025)
Cmod = list(Beta_c1 = .025, Beta_c2 = .025)
Emod = list(Beta_e1 = .025, Beta_e2 = .025)
tmp = umx_make_TwinData(5000, AA =AA, CC = CC, EE = EE, Amod = Amod, Cmod =Cmod, Emod =Emod)
# List of 2
#  $ mzData:'data.frame':	5000 obs. of  6 variables:
#   ..$ defM_T1: num [1:5000] -1.424 -1.606 -0.749 -0.358 -0.208 ...
#   ..$ defM_T2: num [1:5000] -1.703 -1.125 -1.136 0.366 -0.864 ...
#   ..$ M_T1   : num [1:5000] -1.424 -1.606 -0.749 -0.358 -0.208 ...
#   ..$ var_T1 : num [1:5000] -1.1197 -0.3074 -0.4156 -0.4149 0.0739 ...
#   ..$ M_T2   : num [1:5000] -1.703 -1.125 -1.136 0.366 -0.864 ...
#   ..$ var_T2 : num [1:5000] 0.381 -1.275 -1.114 1.297 -1.53 ...
#  $ dzData:'data.frame':	5000 obs. of  6 variables:
#   ..$ defM_T1: num [1:5000] 0.253 -0.402 0.545 -1.494 -0.278 ...
#   ..$ defM_T2: num [1:5000] 1.7587 0.3025 -0.3864 0.0737 0.514 ...
#   ..$ M_T1   : num [1:5000] 0.253 -0.402 0.545 -1.494 -0.278 ...
#   ..$ var_T1 : num [1:5000] -0.835 -0.305 -0.299 -1.576 -0.26 ...
#   ..$ M_T2   : num [1:5000] 1.7587 0.3025 -0.3864 0.0737 0.514 ...
#   ..$ var_T2 : num [1:5000] -0.418 0.678 -0.78 -0.312 -0.272 ...

# TODO tmx example showing how moderation of A introduces heteroskedasticity in a regression model.
# More residual variance at one extreme of the x axis (moderator) 
# m1 = lm(var_T1~ M_T1, data = x); 
# x = rbind(tmp[[1]], tmp[[2]])
# plot(residuals(m1)~ x$M_T1, data=x)



