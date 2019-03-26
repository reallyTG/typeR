library(linkim)


### Name: pgdata
### Title: Proportions of genotypes and distribution of missing values
### Aliases: pgdata
### Keywords: pgdata

### ** Examples

data(barley)
data <- barley[-1:-2,-1]
pro <- pgdata(data)
pro <- pgdata(data,plot=TRUE,type="dist")
pro <- pgdata(data,plot=TRUE,type="barplot")
pro <- pgdata(data,plot=TRUE,type="stacked")



