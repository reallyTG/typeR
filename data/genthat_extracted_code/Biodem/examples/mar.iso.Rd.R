library(Biodem)


### Name: mar.iso
### Title: Observed and Random Marital Isonymy
### Aliases: mar.iso
### Keywords: array methods manip

### ** Examples

data(valley)
valley #a subset of a real marriage data base

mar <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF,freq.table="marriages")
mar # frequency tables of the observed pairs of surnames in each population

iso <- mar.iso(mar)
iso # a data frame containing Pt and Pr values for each (sub)population



