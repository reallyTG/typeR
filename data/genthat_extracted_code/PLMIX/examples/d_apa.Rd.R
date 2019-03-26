library(PLMIX)


### Name: d_apa
### Title: American Psychological Association Data (partial orderings)
### Aliases: d_apa
### Keywords: datasets

### ** Examples

data(d_apa)
head(d_apa)

# Subset of complete sequences

d_apa_compl=d_apa[rowSums(d_apa!=0)>=(ncol(d_apa)-1),]
head(d_apa_compl)



