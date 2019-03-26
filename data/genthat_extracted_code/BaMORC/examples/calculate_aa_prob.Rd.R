library(BaMORC)


### Name: calculate_aa_prob
### Title: Calculates an amino acid typing probability.
### Aliases: calculate_aa_prob

### ** Examples

# Find density for a chi square parameter with 3 degrees of freedom
calculate_aa_prob(0.314, df=3)
# Find density for a list of (chi square statistics) with 2 degrees of freedom
calculate_aa_prob(c(0.05, 0.1, 0.5), 2)



