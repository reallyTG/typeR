library(PLMIX)


### Name: make_partial
### Title: Censoring of complete rankings/orderings
### Aliases: make_partial

### ** Examples


data(d_german)
head(d_german)
d_german_cens <- make_partial(data=d_german, format="ordering", 
                              probcens=c(0.3, 0.3, 0.4))  
head(d_german_cens$partialdata)

# Check consistency with the nominal censoring probabilities
round(prop.table(table(d_german_cens$nranked)), 2)




