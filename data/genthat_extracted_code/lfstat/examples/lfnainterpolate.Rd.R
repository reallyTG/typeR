library(lfstat)


### Name: lfnainterpolate
### Title: Interpolate missing values
### Aliases: lfnainterpolate

### ** Examples

data(ngaruroro)

#Part of the ngaruroro series with missing data
hydrograph(ngaruroro,startdate = "1/7/1987", enddate = "1/9/1987",amin = FALSE)

ngaruroroint <- lfnainterpolate(ngaruroro)

#The completed hydrograph
hydrograph(ngaruroroint,startdate = "1/7/1987", enddate = "1/9/1987",amin = FALSE)



