library(Biodem)


### Name: uri
### Title: Calculates the Unbiased Random Isonymy matrix
### Aliases: uri
### Keywords: array methods manip

### ** Examples

# starting from a raw marriage records dataset:
data(valley)
tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
iso.matrix <- uri(tot)
iso.matrix # a unbiased random isonymy matrix

#starting from a generic surname frequency table
data(surnames)
surnames # a made-up dataset
# you can see that the surnames are arranged as the _rows_
# and the populations are the _columns_
# the function "uri" turns this data into a unbiased random isonymy matrix
iso.matrix <- uri(surnames)
iso.matrix



