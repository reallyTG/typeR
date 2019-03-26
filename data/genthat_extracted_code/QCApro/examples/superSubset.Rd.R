library(QCApro)


### Name: superSubset
### Title: Find Superset and Subset Relations
### Aliases: superSubset
### Keywords: functions

### ** Examples

# Schneider and Wagemann (2013, 212), using data from Ragin 
# (2009, 95), only present G and L as minimally necessary conditions
#-------------------------------------------------------------------

LIP <- data.frame(
 D = c(0.81,0.99,0.58,0.16,0.58,0.98,0.89,0.04,0.07,
       0.72,0.34,0.98,0.02,0.01,0.01,0.03,0.95,0.98),
 U = c(0.12,0.89,0.98,0.07,0.03,0.03,0.79,0.09,0.16,
       0.05,0.10,1.00,0.17,0.02,0.03,0.30,0.13,0.99),
 L = c(0.99,0.98,0.98,0.98,0.99,0.99,0.99,0.13,0.88,
       0.98,0.41,0.99,0.59,0.01,0.17,0.09,0.99,0.99),
 I = c(0.73,1.00,0.90,0.01,0.08,0.81,0.96,0.36,0.07,
       0.01,0.47,0.94,0.00,0.11,0.00,0.21,0.67,1.00),
 G = c(0.43,0.98,0.91,0.91,0.58,0.95,0.31,0.43,0.13,
       0.95,0.58,0.99,0.00,0.01,0.84,0.20,0.91,0.98),
 S = c(0.05,0.95,0.89,0.12,0.77,0.95,0.05,0.06,0.42,
       0.92,0.05,0.95,0.12,0.05,0.21,0.06,0.95,0.95)
)

rownames(LIP) <- c("AT","BE","CZ","EE","FI","FR","DE","GR","HU",
                   "IE","IT","NL","PL","PT","RO","ES","SE","UK")
                   
rownames(superSubset(LIP, outcome = "S", incl.cut = 0.9)$incl.cov)

# with mv-data from Hartmann and Kemmerzell (2010)
#-------------------------------------------------
data(d.partybans)
head(d.partybans)

HK <- superSubset(d.partybans, outcome = "PB", 
  exo.facs = c("C", "F", "T", "V"), incl.cut = 0.75)
HK

# combination membership scores for all cases (only first four 
# combinations and first ten lines displayed)
HK$coms[1:10, 1:4, drop = FALSE]



