library(pairwise)


### Name: Neoffi5
### Title: Polytomous example data in Rost 2004
### Aliases: Neoffi5
### Keywords: datasets

### ** Examples

data(Neoffi5)
dim(Neoffi5)
###########
# frequencies
ftab(Neoffi5)
# Itemparameter to be compared with Rost (2004), page 211.
summary(pair(Neoffi5)) 
# Itemparameter to be compared with Rost (2004), page 213.
summary(pers(pair(Neoffi5))) 



