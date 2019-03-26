library(fChange)


### Name: pick_dim
### Title: Number Of Principal Component Selection Based On Variation
### Aliases: pick_dim

### ** Examples

fdata1 = fun_IID(n=100, nbasis=21)
pick_dim(fdata1, 0.95)
fdata2 = fun_IID(n=100, nbasis=21, Sigma=3^-(1:21))
pick_dim(fdata2, 0.95)





