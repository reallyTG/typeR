library(ISEtools)


### Name: LeadStdAdd
### Title: ISE measurements of lead in soil
### Aliases: LeadStdAdd
### Keywords: datasets

### ** Examples

data(LeadStdAdd)
print(LeadStdAdd)
summary(LeadStdAdd)
plot(LeadStdAdd)
## Not run: 
##D # Additional usage of this dataset with describeISE and analyseISE:
##D example1 = describeISE(LeadStdAdd, Z = 2, temperature = 21)
##D print(example1)
##D summary(example1)
##D plot(example1)
##D example2 = analyseISE(LeadStdAdd, Z = 2, temperature = 21)
##D print(example2)
##D summary(example2)
##D plot(example2, ylim = c(-7, -3), xlab = "ID (Sample)", 
##D 	ylab = expression(paste(log[10], " ", Pb^{paste("2","+",sep="")} )))
## End(Not run)



