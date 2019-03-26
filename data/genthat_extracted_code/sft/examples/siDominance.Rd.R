library(sft)


### Name: siDominance
### Title: Dominance Test for Selective Influence
### Aliases: siDominance
### Keywords: sft

### ** Examples

T1.h <- rexp(50, .2)
T1.l <- rexp(50, .1)
T2.h <- rexp(50, .21)
T2.l <- rexp(50, .11)

HH <- T1.h + T2.h
HL <- T1.h + T2.l
LH <- T1.l + T2.h
LL <- T1.l + T2.l
siDominance(HH, HL, LH, LL)



