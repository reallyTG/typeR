library(fChange)


### Name: insert_change
### Title: Insert A Change In the Mean Function Of Functional Data
### Aliases: insert_change

### ** Examples

####################################
#first generate FAR(1) process
fdata = fun_AR(n=100, nbasis=25, Sigma=2^-(1:25))
# insert the change which is the sum of first 3 basis functions
# in the middle of the data with SNR=2
insert_change(fdata, k=3, change_location=0.5, SNR=2)

####################################
#first generate FAR(1) process
fdata = fun_AR(n=100, nbasis=25, Sigma=2^-(1:25))
# insert the change which is the 20th onservation
# in the middle of the data with SNR=2
insert_change(fdata, change_fun = fdata[20], change_location=0.5, SNR=2)



