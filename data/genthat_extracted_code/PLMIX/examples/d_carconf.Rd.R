library(PLMIX)


### Name: d_carconf
### Title: Car Configurator Data (partial orderings)
### Aliases: d_carconf
### Keywords: datasets

### ** Examples

data(d_carconf)
head(d_carconf)

# Subset of complete sequences

d_carconf_compl=d_carconf[rowSums(d_carconf!=0)>=(ncol(d_carconf)-1),]
head(d_carconf_compl)



