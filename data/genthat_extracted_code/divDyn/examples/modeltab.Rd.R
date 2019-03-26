library(divDyn)


### Name: modeltab
### Title: Origination/extinction response table for statistical modelling.
### Aliases: modeltab

### ** Examples

# load necessary data
data(corals)
# simple table
modTab<-modeltab(corals, bin="stg", tax="genus", taxvars=c("ecology", "family"))




