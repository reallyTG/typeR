library(cregg)


### Name: taxes
### Title: Tax Preference Conjoint Experiment Dataset from Ballard-Rosa et
###   al. (2016)
### Aliases: taxes
### Keywords: datasets

### ** Examples

## No test: 
data("taxes")
f1 <- chose_plan ~ taxrate1 + taxrate2 + taxrate3 + 
        taxrate4 + taxrate5 + taxrate6 + taxrev
cj(taxes, f1, id = ~ ID, weights = ~     weight)
## End(No test)



