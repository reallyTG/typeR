library(pseudorank)


### Name: kepner_robinson_test_internal
### Title: Kepner-Robinson Test
### Aliases: kepner_robinson_test_internal
### Keywords: internal

### ** Examples

x = c(1, 1, 1, 1, 2, 3, 4, 5, 6)
grp = as.factor(c('A','A','B','B','B','D','D','D','D'))

# calculate Kruskal-Wallis test using pseudo-ranks
kruskal_wallis_test(x, grp, na.rm = FALSE, pseudoranks = TRUE)



