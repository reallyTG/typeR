library(fChange)


### Name: change_fPCA
### Title: Change Point Analysis Of Functional Data Via Dimension Reduction
### Aliases: change_fPCA

### ** Examples

# generate functional data
fdata = fun_IID(n=100, nbasis=21)
# insert an artifiical change
data_c = insert_change(fdata, k=21, change_location = 0.5, SNR=1)$fundata
d.hat = pick_dim(data_c, 0.9)$d
change_fPCA(data_c, d=d.hat)$change



