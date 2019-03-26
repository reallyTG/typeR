library(FSelectorRcpp)


### Name: cut_attrs
### Title: Select Attributes by Score Depending on the Cutoff
### Aliases: cut_attrs

### ** Examples


x <- information_gain(Species ~ ., iris)
cut_attrs(attrs = x)
to_formula(cut_attrs(attrs = x), "Species")
cut_attrs(attrs = x, k = 1)



