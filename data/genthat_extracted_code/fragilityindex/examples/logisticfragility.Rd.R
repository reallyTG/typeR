library(fragilityindex)


### Name: logisticfragility
### Title: Logistic Fragility Function
### Aliases: logisticfragility

### ** Examples

# Import and format example data
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
mydata$rank <- factor(mydata$rank)

logisticfragility(admit ~ gre + gpa + rank, data = mydata, covariate="gpa", verbose = TRUE)

logisticfragility(admit ~ gre + gpa + rank, data = mydata)




