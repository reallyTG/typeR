library(fChange)


### Name: Australian_Temp
### Title: Australian Climate Data
### Aliases: Australian_Temp
### Keywords: datasets

### ** Examples

library(fda)
library(reshape2)
fun_data_S = Australian_Temp$Sydney
D = 21
basis = create.fourier.basis(rangeval = c(0, 1), nbasis = D)
nas = which(is.na(fun_data_S$Days.of.accumulation.of.minimum.temperature))
fun_data_S = fun_data_S[-nas, ]
yy = unique(fun_data_S$Year)
mat.S = matrix(0, D, length(yy))
for (i in 1:length(yy)){
 aa = subset(fun_data_S, Year==yy[i])
 cc = aa$Minimum.temperature..Degree.C.
 a = which(is.na(cc))
 if (length(a)>0){
 cc = cc[-which(is.na(cc))]
 }else{
   cc = cc
 }
 f_Obs = Data2fd(argvals=seq(0, 1, length = length(cc)) , cc, basisobj = basis)
 mat.S[, i] = f_Obs$coefs
}
fdata = fd(mat.S, basis)
# note that the last year, has data only up to 6 months
# therefore we remove it
fdata = fdata[-length(yy)]
plot(fdata)



