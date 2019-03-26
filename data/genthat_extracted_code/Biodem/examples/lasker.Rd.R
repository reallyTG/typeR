library(Biodem)


### Name: lasker
### Title: Calculates the lasker kinship coeffcient
### Aliases: lasker
### Keywords: array methods manip

### ** Examples

# starting from a raw marriage records dataset:
data(valley)
tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
lask.kin <- lasker(tot)
lask.kin # a kinship matrix

#starting from a generic surname frequency table
data(surnames)
surnames #a made-up dataset
# the surnames are arranged as the _rows_ and the populations are the _columns_
# the use of the function ``Lasker'' just turns this data into a kinship matrix
lask.kin <- lasker(surnames)
lask.kin



