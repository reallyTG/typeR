library(MLDS)


### Name: kk
### Title: Difference Scale Judgment Data Sets
### Aliases: kk kk1 kk2 kk3 kktriad
### Keywords: datasets

### ** Examples

data(kk1)
plot(mlds(SwapOrder(kk1))) 
# Fit and plot difference scale for first data set kk1, 
#  using quadruples of stimuli

data(kktriad)
plot(mlds(kktriad), type = "b") 
# Fit and plot experimental data 
#   using triples of stimuli



