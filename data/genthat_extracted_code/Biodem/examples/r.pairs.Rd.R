library(Biodem)


### Name: r.pairs
### Title: Observed and Random Repeated Pairs Coefficients
### Aliases: r.pairs
### Keywords: array methods manip

### ** Examples

data(valley)
valley # a subset of a real marriage data base

mar <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF,freq.table="marriages")
mar # frequency tables of the observed pairs of surnames in each population

RP <- r.pairs(mar)
RP # a data frame containing RP, RPr perc.diff values for each (sub)population




