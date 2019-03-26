library(MultiSkew)


### Name: SkewMardia
### Title: Multivariate skewness as defined in Mardia (1970)
### Aliases: SkewMardia

### ** Examples

data(PM10_2006)
PM10_2006_matrix<-data.matrix(PM10_2006)
SkewMardia(PM10_2006_matrix[,2:5])


