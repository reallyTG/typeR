library(EFAutilities)


### Name: efa
### Title: Exploratory Factor Analysis
### Aliases: efa
### Keywords: exploratory factor analysis factor rotation standard error
###   factor loadings

### ** Examples
 
#Examples using the data sets included in the packages:
  
data("CPAI537")    # Chinese personality assessment inventory (N = 537)
   
#1a) normal, ml, oblique, CF-varimax, information, merror='NO'
res1 <- efa(x=CPAI537,factors=4, fm='ml')
res1
  
#1b) confidence intervals: normal, ml, oblique, CF-varimax, information, merror='NO'
#res1$rotatedlow     # lower bound for 95 percent confidence intervals for factor loadings
#res1$rotatedupper   # upper bound for 95 percent confidence intervals for factor loadings
#res1$Philow         # lower bound for 95 percent confidence intervals for factor correlations
#res1$Phiupper       # upper bound for 95 percent confidence intervals for factor correlations	
 
#2) continuous, ml, oblique, CF-quartimax, sandwich, merror='YES'
#efa(x=CPAI537, factors=4, dist='continuous',fm='ml',rotation='CF-quartimax', merror='YES')
 
#3) continuous, ml, oblique, CF-equamax, sandwich, merror='YES'
#efa(x = CPAI537, factors = 4, dist = 'continuous',
#fm = 'ml', rotation = 'CF-equamax', merror ='YES') 

#4) continuous, ml, oblique, CF-facparism, sandwich, merror='YES'
#efa(x = CPAI537, factors = 4, fm = 'ml',
#dist = 'continuous', rotation = 'CF-facparsim', merror='YES')

#5)continuous, ml, orthogonal, CF-parsimax, sandwich, merror='YES'
#efa(x = CPAI537, factors = 4, fm = 'ml', rtype = 'orthogonal', 
#dist = 'continuous', rotation = 'CF-parsimax', merror = 'YES') 

#6) continuous, ols, orthogonal, geomin, sandwich, merror='Yes'
#efa(x=CPAI537, factors=4, dist='continuous',
#rtype= 'orthogonal',rotation='geomin', merror='YES')
 
#7) ordinal, ols, oblique, CF-varimax, sandwich, merror='Yes'
#data("BFI228")      # Big-five inventory (N = 228)
# For ordinal data, estimating SE with the sandwich method 
#   can take time with a dataset with 44 variables
#reduced2 <- BFI228[,1:17] # extracting 17 variables corresponding to the first 2 factors
#efa(x=reduced2, factors=2, dist='ordinal', merror='YES')

#8) continuous, ml, oblique, Cf-varimax, jackknife
#efa(x=CPAI537,factors=4, dist='continuous',fm='ml', merror='YES', se= 'jackknife')
	
#9) extracting the test statistic 
#res2 <-efa(x=CPAI537,factors=4)
#res2
#res2$ModelF$f.stat
	
#10) extended target rotation, ml
# # The data come from Engle et al. (1999) on memory and intelligence.
# datcor <- matrix(c(1.00, 0.51, 0.47, 0.35, 0.37, 0.38, 0.28, 0.34,
#                    0.51, 1.00, 0.32, 0.35, 0.35, 0.31, 0.24, 0.28,
#                    0.47, 0.32, 1.00, 0.43, 0.31, 0.31, 0.29, 0.32,
#                    0.35, 0.35, 0.43, 1.00, 0.54, 0.44, 0.19, 0.27,
#                    0.37, 0.35, 0.31, 0.54, 1.00, 0.59, 0.05, 0.19,
#                    0.38, 0.31, 0.31, 0.44, 0.59, 1.00, 0.20, 0.21,
#                    0.28, 0.24, 0.29, 0.19, 0.05, 0.20, 1.00, 0.68,
#                    0.34, 0.28, 0.32, 0.27, 0.19, 0.21, 0.68, 1.00),
#                  ncol = 8)
# 
# # Prepare target and weight matrices for lambda -------
# MTarget1 <- matrix(c(9, 0, 0,
#                      9, 0, 0,
#                      9, 0, 0, # 0 corresponds to targets
#                      0, 9, 0,
#                      0, 9, 0,
#                      0, 9, 0,
#                      0, 0, 9,
#                      0, 0, 9), ncol = 3, byrow = TRUE)
# MWeight1 <- matrix(0, ncol = 3, nrow = 8)
# MWeight1[MTarget1 == 0] <- 1 # 1 corresponds to targets
# 
# # Prepare target and weight matrices for phi ---------
# PhiTarget1 <- matrix(c(1, 9, 9,
#                        9, 1, 0,
#                        9, 0, 1), ncol = 3)
# PhiWeight1 <- matrix(0, ncol = 3, nrow = 3)
# PhiWeight1[PhiTarget1 == 0] <- 1
# 
# # Conduct extended target rotation -------------------
# mod.xtarget <- efa(covmat = datcor, factors = 3, n.obs = 133,
#                    rotation ='xtarget', fm = 'ml', useorder = T,
#                    MTarget = MTarget1, MWeight = MWeight1,
#                    PhiTarget = PhiTarget1, PhiWeight = PhiWeight1)
# mod.xtarget
# 






