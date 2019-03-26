library(ade4)


### Name: uniquewt.df
### Title: Elimination of Duplicated Rows in a Array
### Aliases: uniquewt.df
### Keywords: utilities

### ** Examples

data(ecomor)
forsub.r <- uniquewt.df(ecomor$forsub)
attr(forsub.r, "factor")
forsub.r[1,]
ecomor$forsub[126,] #idem

dudi.pca(ecomor$forsub, scale = FALSE, scann = FALSE)$eig
# [1] 0.36845 0.24340 0.15855 0.09052 0.07970 0.04490
w1 <- attr(forsub.r, "len.class") / sum(attr(forsub.r,"len.class"))
dudi.pca(forsub.r, row.w = w1, scale = FALSE, scann = FALSE)$eig
# [1] 0.36845 0.24340 0.15855 0.09052 0.07970 0.04490



