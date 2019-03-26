library(Biodem)


### Name: sur.freq
### Title: Calculates surnames frequency tables
### Aliases: sur.freq
### Keywords: array methods manip

### ** Examples

data(valley)
valley #a subset of a real marriage data base

# you can see that marriages correspond to rows in the data frame.
# Note that the data frame contains other columns 

tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
mal <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF,freq.table="males")
mal # a frequency table calculated above the male surnames
fem <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF,freq.table="females")
fem # a frequency table calculated above the female surnames
mar <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF,freq.table="marriages")
mar # frequency tables for the observed pairs of surnames in each population



