library(magclass)


### Name: magpie-class
### Title: Class "magpie" ~~~
### Aliases: magpie-class as.magpie as.magpie-methods
###   as.magpie,magpie-method as.magpie,array-method as.magpie,lpj-method
###   as.magpie,data.frame-method as.magpie,numeric-method
###   as.magpie,NULL-method as.magpie,quitte-method as.magpie,tbl_df-method
###   is.magpie [,magpie-method [,magpie,ANY,ANY-method
###   [<-,magpie,ANY,ANY-method [<-,magpie-method Ops,magpie,magpie-method
### Keywords: classes

### ** Examples


showClass("magpie")

data(population_magpie)

# returning PAO and PAS for 2025
population_magpie["PA",2025,,pmatch="left"]

# returning CPA for 2025
population_magpie["PA",2025,,pmatch="right"]

# returning CPA PAO and PAS for 2025
population_magpie["PA",2025,,pmatch=TRUE]

# returning PAS and 2025
population_magpie["PAS",2025,]

# returning everything but values for PAS or values for 2025
population_magpie["PAS",2025,,invert=TRUE]






