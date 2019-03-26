library(fChange)


### Name: change_FF
### Title: Change Point Analysis Of Functional Data Without Dimension
###   Reduction (Fully Functional)
### Aliases: change_FF

### ** Examples

# generate functional data
fdata = fun_IID(n=100, nbasis=21)
# insert an artifiical change
data_c = insert_change(fdata, k=21, change_location = 0.5, SNR=1)$fundata
change_FF(data_c)$change






