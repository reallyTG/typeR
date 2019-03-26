library(cna)


### Name: cna
### Title: Perform Coincidence Analysis
### Aliases: cna cscna mvcna fscna print.cna

### ** Examples

# Ideal crisp-set data from Baumgartner (2009a) on education levels in western democracies
#---------------------------------------------------------------------------------------
# Exhaustive CNA without constraints on the search space; print atomic and complex 
# solution formulas (default output).
cna.educate <- cna(d.educate)
cna.educate
# The two resulting complex solution formulas represent a common cause structure 
# and a causal chain, respectively. The common cause structure is graphically depicted 
# in (Note, figure (a)), the causal chain in (Note, figure (b)).

# Print only complex solution formulas.
print(cna.educate, what = "c")

# Print only atomic solution formulas.
print(cna.educate, what = "a")

# Print only minimally sufficient conditions.
print(cna.educate, what = "m")

# Print only the truth table.
print(cna.educate, what = "t")

# CNA with negations of the factors E and L.
cna(d.educate, notcols = c("E","L"))

# CNA with negations of all factors.
cna(d.educate, notcols = "all")

# Print msc, asf, and csf with all solution attributes.
cna(d.educate, what = "mac", details = TRUE)

# Add only the non-standard solution attributes "inus" and "faithfulness".
cna(d.educate, details = c("i", "f"))

# Print solutions without spaces before and after "+".
options(spaces = c("<->", "->" ))
cna(d.educate, details = c("i", "f"))

# Print solutions with spaces before and after "*".
options(spaces = c("<->", "->", "*" ))
cna(d.educate, details = c("i", "f"))

# Restore the default of the option "spaces".
options(spaces = c("<->", "->", "+"))


# Crisp-set data from Krook (2010) on representation of women in western-democratic parliaments
# -------------------------------------------------------------------------------------------
# This example shows that CNA can infer which factors are causes and which ones
# are effects from the data. Without being told which factor is the outcome, 
# CNA reproduces the original QCA of Krook (2010).
## No test: 
ana1 <- cna(d.women, maxstep = c(3, 4, 9), details = c("e", "f"))
ana1
## End(No test)

# The two resulting asf only reach an exhaustiveness score of 0.438, meaning that
# not all configurations that are compatible with the asf are contained in the data
# "d.women". Here is how to extract the configurations that are compatible with 
# the first asf but are not contained in "d.women":
## No test: 
library(dplyr)
setdiff(tt2df(selectCases(asf(ana1)$condition[1], 
              cna:::full.tt(d.women))),
        d.women)
## End(No test)

# Highly ambiguous crisp-set data from Wollebaek (2010) on very high volatility of 
# grassroots associations in Norway
# --------------------------------------------------------------------------------
# csCNA with ordering from Wollebaek (2010) [Beware: due to massive ambiguities, this analysis
# will take about 20 seconds to compute.]
## No test: 
cna(d.volatile, ordering = list("VO2"), maxstep = c(6, 6, 16))
## End(No test)
              
# Using suff.only, CNA can be forced to abandon the analysis after minimization of sufficient 
# conditions. [This analysis terminates quickly.]
cna(d.volatile, ordering = list("VO2"), maxstep = c(6, 6, 16), suff.only = TRUE)

# Similarly, by using the default maxstep, CNA can be forced to only search for asf and csf
# with reduced complexity. [This analysis also terminates quickly.]
cna(d.volatile, ordering = list("VO2"))


# Multi-value data from Hartmann & Kemmerzell (2010) on party bans in Africa
# ---------------------------------------------------------------------------
# mvCNA with causal ordering that corresponds to the ordering in Hartmann & Kemmerzell 
# (2010); coverage cutoff at 0.95 (consistency cutoff at 1), maxstep at (6, 6, 10).
cna.pban <- mvcna(d.pban, ordering = list(c("C","F","T","V"),"PB"), cov = .95,
                  maxstep = c(6, 6, 10), what = "all")
cna.pban

# The previous function call yields a total of 14 asf and csf, only 5 of which are 
# printed in the default output. Here is how to extract all 14 asf and csf.
asf(cna.pban)
csf(cna.pban)

# [Note that all of these 14 causal models reach considerably better consistency and 
# coverage scores than the one model Hartmann & Kemmerzell (2010) present in their paper, 
# which they generated using the TOSMANA software, version 1.3: 
# T=0 + T=1 + C=2 + T=1*V=0 + T=2*V=0 <-> PB=1
mvcond("T=0 + T=1 + C=2 + T=1*V=0 + T=2*V=0 <-> PB = 1", d.pban)

# That is, not only does TOSMANA fail to recover model ambiguities in this case, it 
# also issues a model whose fit is significantly below the models this data set would 
# warrant.] 

# Extract all minimally sufficient conditions.
msc(cna.pban)

# Alternatively, all msc, asf, and csf can be recovered by means of the nsolutions
# argument of the print function.
print(cna.pban, nsolutions = "all")

# Print the truth table with the "cases" column.
print(cna.pban, what = "t", show.cases = TRUE)

# Build solution formulas with maximally 4 disjuncts.
## No test: 
mvcna(d.pban, ordering = list(c("C","F","T","V"),"PB"), cov = .95, maxstep = c(4, 4, 10))

# Only print 2 digits of consistency and coverage scores.
print(cna.pban, digits = 2)

# Build all but print only two msc for each factor and two asf and csf.
print(mvcna(d.pban, ordering = list(c("C","F","T","V"),"PB"), cov = .95,
      maxstep = c(6, 6, 10), what = "all"), nsolutions = 2)

# Lowering the consistency instead of the coverage threshold yields further models with
# excellent fit scores; print only asf.
mvcna(d.pban, ordering = list(c("C","F","T","V"),"PB"), con = .93, what = "a",
      maxstep = c(6, 6, 10))

# Importing an ordering from prior causal knowledge is unnecessary for d.pban. PB  
# is the only factor in that data that could possibly be an outcome.
mvcna(d.pban, cov = .95, maxstep = c(6, 6, 10))
## End(No test)

# Fuzzy-set data from Basurto (2013) on autonomy of biodiversity institutions in Costa Rica
# ---------------------------------------------------------------------------------------
# Basurto investigates two outcomes: emergence of local autonomy and endurance thereof. The 
# data for the first outcome is contained in rows 1-14 of d.autonomy, the data for the second
# outcome in rows 15-30. For each outcome, the author distinguishes between local ("EM",  
# "SP", "CO"),  national ("CI", "PO") and international ("RE", "CN", "DE") conditions. Here,   
# we first apply fsCNA to replicate the analysis for the local conditions of the endurance of 
# local autonomy.
dat1 <- d.autonomy[15:30, c("AU","EM","SP","CO")]
fscna(dat1, ordering = list("AU"), strict = TRUE, con = .9, cov = .9)

# The fsCNA model has significantly better consistency (and equal coverage) scores than the 
# model presented by Basurto (p. 580): SP*EM + CO <-> AU, which he generated using the 
# fs/QCA software.
fscond("SP*EM + CO <-> AU", dat1) # both EM and CO are redundant to account for AU

# If we allow for dependencies among the conditions by setting strict = FALSE, CNA reveals 
# that SP is a common cause of both AU and EM:
fscna(dat1, ordering = list("AU"), strict = FALSE, con = .9, cov = .9)

# Here is the analysis for the international conditions of autonomy endurance, which
# yields the same model presented by Basurto (plus one model Basurto does not mention):
dat2 <- d.autonomy[15:30, c("AU","RE", "CN", "DE")]
fscna(dat2, ordering = list("AU"), con = .9, con.msc = .85, cov = .85)

# But there are other models (here printed with all solution attributes)
# that fare equally well.
fscna(dat2, ordering = list("AU"), con = .85, cov = .9, details = TRUE)

# Finally, here is an analysis of the whole data set, showing that across the whole period 
# 1986-2006, the best causal model of local autonomy (AU) renders that outcome dependent
# only on local direct spending (SP):
## No test: 
fscna(d.autonomy, ordering = list("AU"), strict = TRUE, con = .85, cov = .9, 
                maxstep = c(5, 5, 11), details = TRUE)
## End(No test)

# Only build INUS solutions.
## No test: 
asf(fscna(d.autonomy, ordering = list("AU"), strict = TRUE, con = .85, cov = .9, 
                    maxstep = c(5, 5, 11), details = TRUE, inus.only = TRUE))
## End(No test)


# Highly ambiguous artificial data to illustrate exhaustiveness
# -------------------------------------------------------------
dat <- allCombs(c(2,2,2,2,2,2)) - 1
mycond <- "(D + C*f <-> A)*(C*d + c*D <-> B)*(B*d + D*f <-> C)*(c*B + B*f <-> E)"
dat1 <- selectCases(mycond, dat)
## No test: 
ana1 <- cna(dat1, details = TRUE)
## End(No test)
# There are almost 2M csf. This is how to build the first 360 of them:
## No test: 
csf360 <- csf(ana1, 360)
## End(No test)
# Most of these csf are compatible with more configurations than are contained in 
# dat1. Only 32 of csf360 are perfectly exhaustive (i.e. all compatible 
# configurations are contained in dat1):
## No test: 
subset(csf360, exhaustiveness == 1)
## End(No test)

# Eliminate structural redundancies.
## No test: 
minimalizeCsf(subset(csf360, exhaustiveness == 1)$condition, dat1)
## End(No test)


# Inverse search trials to assess the correctness of cna
# ------------------------------------------------------
# 1. ideal mv data, i.e. perfect consistencies and coverages, without data fragmentation.
## No test: 
dat1 <- allCombs(c(4, 4, 4, 4, 4)) 
dat2 <- selectCases("(A=1*B=2 + A=4*B=3 <-> C=1)*(C=4*D=1 + C=2*D=4 <-> E=4)", dat1, 
                    type = "mv")
mvcna(dat2)

# with data fragmentation: only 100 of 472 observable configurations are actually
# observed. [Repeated runs will generate different data frames.]
dat1 <- allCombs(c(4, 4, 4, 4, 4)) 
dat2 <- selectCases("(A=1*B=2 + A=4*B=3 <-> C=1)*(C=4*D=1 + C=2*D=4 <-> E=4)", dat1, 
                    type = "mv")
dat3 <- some(dat2, n = 100, replace = TRUE)
mvcna(dat3)

# 2. fs data with imperfect consistencies (con = 0.8) and coverages (cov = 0.8); about
# 150 cases (depending on the seed). [Repeated runs will generate different data frames.]
dat1 <- allCombs(c(2, 2, 2, 2, 2)) - 1
dat2 <- some(truthTab(dat1), n = 200, replace = TRUE)
dat3 <- makeFuzzy(tt2df(dat2), fuzzvalues = seq(0, 0.45, 0.01))
dat4 <- selectCases1("a*B + c*D + b*d <-> E", con = .8, cov = .8, type = "fs", dat3)
fscna(dat4, ordering = list("E"), strict = TRUE, con = .8, cov = .8)

# data fragmentation: only 80 of about 150 possible cases are actually observed.
# [Repeated runs will generate different data frames.]
dat1 <- allCombs(c(2, 2, 2, 2, 2)) - 1
dat2 <- some(truthTab(dat1), n = 200, replace = TRUE)
dat3 <- makeFuzzy(tt2df(dat2), fuzzvalues = seq(0, 0.45, 0.01))
dat4 <- selectCases1("a*B + c*D + b*d <-> E", con = .8, cov = .8, type = "fs", dat3)
dat5 <- some(dat4, n = 80, replace = TRUE)
fscna(dat5, ordering = list("E"), strict = TRUE, con = .8, cov = .8)
## End(No test)

# Illustration of only.minimal.msc = FALSE
# ----------------------------------------
# Simulate noisy data on the causal structure "a*B*d + A*c*D <-> E"
set.seed(1324557857)
mydata <- allCombs(rep(2, 5)) - 1
dat <- makeFuzzy(mydata, fuzzvalues = seq(0, 0.5, 0.01))
dat <- tt2df(selectCases1("a*B*d + A*c*D <-> E", con = .8, cov = .8, dat))

# In dat, "a*B*d + A*c*D <-> E" has the following con and cov scores:
as.condTbl(fscond("a*B*d + A*c*D <-> E", dat))

# The standard algorithm of cna will, however, not find this structure with
# con = cov = 0.8 because one of the disjuncts (a*B*d) does not meet the con
# threshold:
as.condTbl(fscond(c("a*B*d <-> E", "A*c*D <-> E"), dat))
fscna(dat, ordering=list("E"), strict = TRUE, con = .8, cov = .8)

# With the argument con.msc we can lower the con threshold for msc, but this does not
# recover "a*B*d + A*c*D <-> E" either:
cna2 <- fscna(dat, ordering=list("E"), strict = TRUE, con = .8, cov = .8, con.msc = .7)
cna2
msc(cna2)

# The reason is that "a*B -> E" and "c*D -> E" now also meet the con.msc threshold and,
# therefore, neither "a*B*d -> E" nor "A*c*D -> E" are contained in the msc---
# because of violated minimality. In a situation like this, lifting the minimality  
# requirement via only.minimal.msc = FALSE allows cna to find the intended target:
fscna(dat, ordering=list("E"), strict=TRUE, con = .8, cov = .8, con.msc = .7,
      only.minimal.msc = FALSE)



