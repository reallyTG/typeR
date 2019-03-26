library(mice)


### Name: md.pairs
### Title: Missing data pattern by variable pairs
### Aliases: md.pairs
### Keywords: univar

### ** Examples



pat <- md.pairs(nhanes)
pat

# show that these four matrices decompose the total sample size
# for each pair
pat$rr + pat$rm + pat$mr + pat$mm

# percentage of usable cases to impute row variable from column variable
round(100*pat$mr/(pat$mr+pat$mm))




