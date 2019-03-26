library(CIAAWconsensus)


### Name: mmm
### Title: Multivariate meta-analysis of correlated effects
### Aliases: mmm

### ** Examples

## Consensus isotope amount ratios for platinum
df=normalize.ratios(platinum.data, "platinum", "195Pt")
mmm(df$R, df$u.R)



