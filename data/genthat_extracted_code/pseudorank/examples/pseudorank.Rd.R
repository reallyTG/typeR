library(pseudorank)


### Name: pseudorank
### Title: Calculation of Pseudo-Ranks
### Aliases: pseudorank pseudorank.numeric pseudorank.formula
### Keywords: export

### ** Examples

df <- data.frame(data = round(rnorm(100)), group = c(rep(1,40),rep(2,40),rep(3,20)))
df$group <- as.factor(df$group)

## two ways to calculate pseudo-ranks

# Variant 1: use a vector for the data and a group vector
pseudorank(df$data,df$group)

# Variant 2: use a formula object, Note that only one group factor can be used
# that is, in data~group*group2 only 'group' will be used
pseudorank(data~group,df)



