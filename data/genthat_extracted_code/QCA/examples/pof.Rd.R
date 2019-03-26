library(QCA)


### Name: Parameters of fit
### Title: Calculate parameters of fit
### Aliases: pof pofind
### Keywords: functions

### ** Examples


# -----
# Cebotari & Vink (2013) fuzzy data
data(CVF) 

conds <- CVF[, 1:5]
PROTEST <- CVF$PROTEST

# parameters of fit (default is necessity)
pof(conds, PROTEST)

# parameters of fit negating the conditions
pof(1 - conds, PROTEST)

# negating the outcome
pof(conds, 1 - PROTEST)

# parameters of fit for sufficiency
pof(conds, PROTEST, relation = "suf")

# also negating the outcome
pof(conds, 1 - PROTEST, relation = "suf")


# -----
# standard analysis of necessity
# using the "coms" component from superSubset()
nCVF <- superSubset(CVF, outcome = "PROTEST", incl.cut = 0.90, cov.cut = 0.6)

# also checking their necessity inclusion score in the negated outcome
pof(nCVF$coms, 1 - PROTEST)


# -----
# standard analysis of sufficiency
# using the "pims" component from minimize()

# conservative solution
cCVF <- minimize(CVF, outcome = "PROTEST", incl.cut = 0.8, details = TRUE)

# verify if their negations are also sufficient for the outcome
pof(1 - cCVF$pims, PROTEST, relation = "sufficiency")


# -----
# using a SOP expression, translated using the function translate()

# notice that lower case letters mean the absence of a causal condition
pof("natpride + GEOCON => PROTEST", data = CVF)

# same for the negation of the outcome
pof("natpride + GEOCON => ~PROTEST", data = CVF)

# same using lower letters for the negation
pof("natpride + GEOCON => protest", data = CVF)

# necessity is indicated by the reverse arrow
pof("natpride + GEOCON <= PROTEST", data = CVF)


# -----
# more parameters of fit, for instance Haesebrouck' consistency

inclH <- function(x, y) {
    sum(fuzzyand(x, y)) /
    sum(fuzzyand(x, y) + sqrt(fuzzyor(x - y, 0)*x))
}

pof("natpride + GEOCON => protest", data = CVF, add = inclH)




