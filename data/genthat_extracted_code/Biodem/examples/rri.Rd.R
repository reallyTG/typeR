library(Biodem)


### Name: rri
### Title: Calculates an unbiased estimate of Regional Random Isonymy
### Aliases: rri
### Keywords: array methods manip

### ** Examples

# starting from a raw marriage records dataset:
data(valley)
tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
reg <- rri(tot)
reg # an unbiased estimate or Regional Random Isonymy

#starting from a generic surname frequency table
data(surnames)
surnames # a made-up dataset
# you can see that the surnames are arranged as the _rows_
# and the populations are the _columns_
reg <- rri(surnames)
reg # an unbiased estimate or Regional Random Isonymy



