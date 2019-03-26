library(QZ)


### Name: QZ Decomposition Reordering
### Title: Reordering QZ Decomposition
### Aliases: ordqz
### Keywords: programming

### ** Examples

library(QZ, quiet = TRUE)

# Reordering eigenvalues
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "lhp"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "rhp"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "udi"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "udo"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "ref"))
(ret <- ordqz(exAB1$A, exAB1$B, keyword = "cef"))




