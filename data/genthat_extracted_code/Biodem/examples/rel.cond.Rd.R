library(Biodem)


### Name: rel.cond
### Title: Calculates a conditional kinship matrix from isonymy data
### Aliases: rel.cond
### Keywords: array methods manip

### ** Examples

# starting from a raw marriage records dataset:
data(valley)
tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
iso.matrix <- uri(tot)
iso.matrix # an unbiased random isonymy matrix
reg <- rri(tot)
reg # a coefficient of unbiased Regional Random Isonymy
kin.cond <- rel.cond(iso.matrix,reg)
kin.cond # a conditional kinship matrix

#starting from a generic surname frequency table
data(surnames)
surnames # a made-up dataset
iso.matrix <- uri(surnames)
iso.matrix # an unbiased random isonymy matrix
reg <- rri(surnames)
reg # a coefficient of unbiased Regional Random Isonymy
kin.cond <- rel.cond(iso.matrix,reg)
kin.cond # a conditional kinship matrix



