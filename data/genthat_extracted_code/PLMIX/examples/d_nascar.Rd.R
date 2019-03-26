library(PLMIX)


### Name: d_nascar
### Title: NASCAR Data (partial orderings)
### Aliases: d_nascar
### Keywords: datasets

### ** Examples

data(d_nascar)
head(d_nascar)

# Compute the number of races for each of the 87 drivers

table(c(d_nascar[,1:43]))

# Identify drivers arrived last (43th position) in all the races
# where they participated in

which(colSums(rank_summaries(d_nascar, format="ordering")$marginals[1:42,])==0)

# Obscure drivers 84, 85, 86 and 87 to get 
# the reduced dataset with 83 racers employed by Hunter, D. R. (2004)

d_nascar_hunter=d_nascar[,1:83]
d_nascar_hunter[is.element(d_nascar_hunter,84:87)]=0



