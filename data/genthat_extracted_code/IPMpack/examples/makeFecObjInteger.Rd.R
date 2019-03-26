library(IPMpack)


### Name: makeFecObjInteger
### Title: Function to build fecundity objects
### Aliases: makeFecObjInteger makeClonalObjInteger

### ** Examples

# Open dataset for the herbaceous perennial Cryptantha flava where 
# the state variable is integer (number of rosettes)
data(dataIPMpackCryptantha)
head(dataIPMpackCryptantha)
d <- dataIPMpackCryptantha

#See the description of the data for information on the variables
help(dataIPMpackCryptantha)

# For this example, focus only on the first annual transition 
# available in the dataset
d1 <- d[d$year==2004, ]

#Create fecundity object with integer data
fo <- makeFecObjInteger(d1, Formula = fec1~size, distOffspring = "poisson")


#Example with imposed offspring object
off1 <- makeOffspringObj(dataf = d1, Formula = sizeNext~1, Family="poisson")
fo <- makeFecObjInteger(d1, Formula = fec1~size, distOffspring = "poisson", 
		doOffspring=FALSE)
Fmatrix <-  makeIntegerFmatrix(fecObj = fo, offspringObj=off1)







