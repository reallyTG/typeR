library(pseudorank)


### Name: kruskal_wallis_internal
### Title: Hettmansperger-Norton Trend Test for k-Samples
### Aliases: kruskal_wallis_internal
### Keywords: internal

### ** Examples

x = c(1, 1, 1, 1, 2, 3, 4, 5, 6)
grp = as.factor(c('A','A','B','B','B','D','D','D','D'))

# calculate Kruskal-Wallis test using pseudo-ranks
kruskal_wallis_test(x, grp, na.rm = FALSE, pseudoranks = TRUE)



