library(MultiSkew)


### Name: MultiSkew-package
### Title: MultiSkew
### Aliases: MultiSkew-package MultiSkew
### Keywords: package

### ** Examples

data(PM10_2006)
PM10_2006_matrix<-data.matrix(PM10_2006)

MinSkew(PM10_2006_matrix[,2:5],4)
PartialSkew(PM10_2006_matrix[,2:5])
SkewMardia(PM10_2006_matrix[,2:5])
Third(PM10_2006_matrix[,2:5], "raw")

#library(MaxSkew)

SkewBoot(PM10_2006_matrix[,2:5], 50, 50, "Directional")
SkewBoot(PM10_2006_matrix[,2:5], 50, 50, "Mardia")
SkewBoot(PM10_2006_matrix[,2:5], 50, 50, "Partial")




