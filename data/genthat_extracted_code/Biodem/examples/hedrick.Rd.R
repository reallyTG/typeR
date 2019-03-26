library(Biodem)


### Name: hedrick
### Title: Calculates the Hedrick standardized kinship coefficient
### Aliases: hedrick
### Keywords: array methods manip

### ** Examples

# starting from a raw marriage records dataset:
data(valley)
tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
hed.kin <- hedrick(tot)
hed.kin # a standardized kinship matrix

#starting from a generic surname frequency table
data(surnames)
surnames #a made-up dataset
# you can see that the surnames are arranged as the _rows_ and
# the populations are the _columns_
# the use of the function "hedrick" just turns this data into a kinship matrix
hed.kin <- hedrick(surnames)
hed.kin



