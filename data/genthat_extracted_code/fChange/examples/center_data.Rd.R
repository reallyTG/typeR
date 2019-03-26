library(fChange)


### Name: center_data
### Title: Center Functional Data With Change
### Aliases: center_data

### ** Examples

# Generate FAR(1) process with change in the mean
f_AR = fun_AR(n=100, nbasis=21, kappa=0.9)
f_AR_change = insert_change(f_AR, k=20, change_location = 0.5, SNR=5)
fdata = f_AR_change$fundata
c_fdata = center_data(fdata)
par(mfrow=c(1,2))
plot(fdata, main="Functional Data")
plot(c_fdata, main="Centered Functional Data")



