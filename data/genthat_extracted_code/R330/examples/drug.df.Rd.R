library(R330)


### Name: drug.df
### Title: Drug addiction data
### Aliases: drug.df
### Keywords: datasets

### ** Examples

data(drug.df)
cross.val(DFREE ~ NDRUGTX + factor(IVHX) + AGE + TREAT, data = drug.df)




