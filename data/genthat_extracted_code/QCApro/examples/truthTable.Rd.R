library(QCApro)


### Name: truthTable
### Title: Create a Truth Table
### Aliases: truthTable is.tt
### Keywords: functions

### ** Examples

# csQCA using Krook (2010)
#-------------------------
data(d.represent)
head(d.represent)

# print truth table; if all factors except that of the outcome in 
# the data should be included as exogenous factors, then these need 
# not be specified separately
truthTable(d.represent, outcome = "WNP")

# print complete truth table, show cases, and first sort by 
# inclusion scores, then by number of cases
truthTable(d.represent, outcome = "WNP", complete = TRUE, 
  show.cases = TRUE, sort.by = c("incl", "n"))

# code minterms with a single case as remainders (note: use of 
# 'n.cut' should be well justified)
KRO.tt <- truthTable(d.represent, outcome = "WNP", n.cut = 2, 
  show.cases = TRUE)
KRO.tt

# print cases that were assigned to remainders based on argument 'n.cut'
KRO.tt$excluded

# fsQCA using Emmenegger (2011)
#------------------------------
data(d.jobsecurity)
head(d.jobsecurity)

# code non-remainder minterms with inclusion scores between 0.4 
# and 0.8 as contradictions (note: these are not 'contradictions' 
# in the logical sense of the word but minterms that can neither 
# be coded as sufficient nor as insufficient for the outcome)
truthTable(d.jobsecurity, outcome = "JSR", incl.cut1 = 0.8, incl.cut0 = 0.4)

# truth table based on the negated outcome
truthTable(d.jobsecurity, outcome = "JSR", neg.out = TRUE, incl.cut1 = 0.8, 
  incl.cut0 = 0.4)

# mvQCA using Hartmann and Kemmerzell (2010)
#-------------------------------------------
data(d.partybans)
head(d.partybans)

# code non-remainder minterms with inclusion scores below 1 
# but above 0.4 as contradictions 
HK.tt <- truthTable(d.partybans, outcome = "PB", 
  exo.facs = c("C","F","T","V"), incl.cut0 = 0.4)
HK.tt

# list the number of levels for the exogenous factors  
HK.tt$noflevels

# which minterms have more than 2 cases?
HK.tt$tt[which(HK.tt$tt$n > 2), ]

# code output function values in truth table based on 
# exact binomial test
truthTable(d.partybans, outcome = "PB", exo.facs = c("C","F","T"), 
  incl.cut1 = 0.9, incl.cut0 = 0.4, show.cases = TRUE, 
  inf.test = c("binom", 0.1))

# tQCA using Ragin and Strand (2008)
#-----------------------------------
data(d.graduate)
head(d.graduate)

# tQCA truth table with "don't care" values
truthTable(d.graduate, outcome = "REC")




