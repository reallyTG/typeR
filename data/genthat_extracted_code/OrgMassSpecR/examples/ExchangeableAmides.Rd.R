library(OrgMassSpecR)


### Name: ExchangeableAmides
### Title: Determine the Number of Backbone Amide Hydrogens
### Aliases: ExchangeableAmides

### ** Examples

ExchangeableAmides(c("VDVMCTA", "VSTPTL"))

## find the number of exchangeable amides for 
## each peptide in a digest of human serum albumin
x <- Digest(example.sequence, enzyme = "pepsin", IAA = FALSE, missed = 4)
transform(x, exchange = ExchangeableAmides(x$peptide))



