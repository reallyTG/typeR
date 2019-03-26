library(MLDS)


### Name: rbind.mlds.df
### Title: Concatenate Objects of Class 'mlbs.df' or 'mlds.df' by Row
### Aliases: rbind.mlds.df rbind.mlbs.df Rbind
### Keywords: manip

### ** Examples

data(kk1)
data(kk2)
data(kk3)
kk <- rbind(kk1, kk2, kk3)
nrow(kk1)
nrow(kk)
length(attr(kk1, "invord"))
length(attr(kk, "invord"))



