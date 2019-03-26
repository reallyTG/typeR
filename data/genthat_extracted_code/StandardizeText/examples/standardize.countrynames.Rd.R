library(StandardizeText)


### Name: standardize.countrynames
### Title: Standardize Country Names
### Aliases: standardize.countrynames
### Keywords: standardize matching country names

### ** Examples

library(StandardizeText)
sample.names <- c("Aland Is.","Brunei Daru.","Ivory Coast","The Gambia")
sample.std <- c("brunei","aland is","gambia, the","cote divoire")
sample.df <- data.frame(foo=2:5,bar=sample.names, baz=7:4, qux=sample.std)

#Standardize vector using iso names
out.a <- standardize.countrynames(sample.names,standard="iso",suggest="auto")
#Standardize vector using provided names
out.b <- standardize.countrynames(sample.names,standard=sample.std,suggest="auto")
#Standardize dataframe using wb names
out.c <- standardize.countrynames(sample.df,2,standard="wb",suggest="auto",verbose=TRUE)
#Standardize dataframe using provided names without suggestions
out.d <- standardize.countrynames(sample.df,"bar",sample.df,"qux",suggest="none",verbose=TRUE)



