library(PLMIX)


### Name: d_dublinwest
### Title: Dublin West Data (partial orderings)
### Aliases: d_dublinwest
### Keywords: datasets

### ** Examples

data(d_dublinwest)
head(d_dublinwest)

# Subset of complete sequences

d_dublinwest_compl=d_dublinwest[rowSums(d_dublinwest!=0)>=(ncol(d_dublinwest)-1),]
head(d_dublinwest_compl)



