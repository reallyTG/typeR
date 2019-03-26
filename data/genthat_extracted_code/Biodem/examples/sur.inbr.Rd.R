library(Biodem)


### Name: sur.inbr
### Title: Total, Random and Non-random Inbreeding Coefficients
### Aliases: sur.inbr
### Keywords: array methods manip

### ** Examples

data(valley)
valley # a subset of a real marriage data base

mar <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF,freq.table="marriages")
mar # frequency tables calculated above the observed pairs of surnames in each population

iso <- mar.iso(mar)
iso # a data frame containing Pt and Pr values for each (sub)population

inbreeding <- sur.inbr(iso)
inbreeding # inbreeding indexes calculated using the method "B"

inbreeding2 <- sur.inbr(iso,method="A")
inbreeding2 # inbreeding indexes calculated using the method "A"



