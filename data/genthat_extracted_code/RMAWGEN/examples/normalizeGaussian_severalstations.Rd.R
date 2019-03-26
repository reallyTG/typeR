library(RMAWGEN)


### Name: normalizeGaussian_severalstations
### Title: Converts several samples 'x' random variable extracted by
###   populations represented by the columns of 'data' respectively or
###   'sample' to a normally-distributed samples with assinged mean and
###   standard deviation or vice versa in case 'inverse' is 'TRUE'
### Aliases: normalizeGaussian_severalstations

### ** Examples


library(RMAWGEN) 
N <- 30
x <- rexp(N)
y <- x+rnorm(N)
df <- data.frame(x=x,y=y)

dfg <- normalizeGaussian_severalstations(df,data=df,extremes=TRUE,inverse=FALSE)

dfi <- normalizeGaussian_severalstations(dfg,data=df,extremes=TRUE,inverse=TRUE)


 




