library(basicspace)


### Name: blackbox_transpose
### Title: Blackbox transpose Scaling
### Aliases: blackbox_transpose
### Keywords: multivariate

### ** Examples

### Loads and scales the Liberal-Conservative scales from the 1980 NES.
data(LC1980)
LCdat=LC1980[,-1]	#Dump the column of self-placements


### This command conducts estimates, which we instead load using data()

#LC1980_bbt <- blackbox_transpose(LCdat,missing=c(0,8,9),dims=3,minscale=5,verbose=TRUE)
data(LC1980_bbt)
plot(LC1980_bbt)

par(ask=TRUE)
plotcdf.blackbt(LC1980_bbt)
summary(LC1980_bbt)



