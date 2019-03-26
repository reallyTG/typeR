library(far)


### Name: fdata
### Title: Functional Data class
### Aliases: as.fdata as.fdata.default as.fdata.matrix as.fdata.array
###   as.fdata.list fdata print.fdata summary.fdata print.summary.fdata
### Keywords: ts misc

### ** Examples

# Reading of the data
library(stats)
data(UKDriverDeaths)

# Making the data of class 'fdata'
fUKDriverDeaths <- as.fdata(UKDriverDeaths,col=1,p=12,dates=1969:1984,
                            name="UK Driver Deaths")
summary(fUKDriverDeaths)

# ploting of the data : whole and 1 year
par(mfrow=c(2,1))
plot(fUKDriverDeaths,xval=1969+(1:192)/12,whole=TRUE,
     name="Whole Evolution : ")
plot(fUKDriverDeaths,date="1984",xval=1:12,
     name="Evolution during year 1984 : ")

# Matrix conversion
print(as.fdata(matrix(rnorm(50),10,5)))
print(as.fdata(matrix(rnorm(500),100,5),col=1:2,p=5))

# List Conversions
print(as.fdata(list("X"=matrix(rnorm(100),10,10),
"Z"=matrix(rnorm(50),5,10))))



