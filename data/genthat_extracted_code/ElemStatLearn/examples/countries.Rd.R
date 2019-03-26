library(ElemStatLearn)


### Name: countries
### Title: Country Dissimilarities
### Aliases: countries
### Keywords: datasets

### ** Examples

str(countries)
colnames(countries)
rownames(countries)
if(require(MASS)){
# We use multidimensional scaling:
   if(interactive())par(ask=TRUE)
   countries.cmdscale <- cmdscale(countries, k=2, eig=TRUE)
   eqscplot(countries.cmdscale$points)
   countries.sam <- sammon(countries)
   eqscplot(countries.sam$points)
}



