library(ISEtools)


### Name: ISEtools-package
### Title: Analysis tools for ion selective electrodes (ISEs)
### Aliases: ISEtools-package ISEtools
### Keywords: package

### ** Examples

data(LeadStdAdd)
print(LeadStdAdd)
summary(LeadStdAdd)
plot(LeadStdAdd)
## No test: 
example1 = describeISE(LeadStdAdd, Z =2, temperature=21)
print(example1)
summary(example1)
plot(example1)
example2 = analyseISE(LeadStdAdd, Z =2, temperature=21)
print(example2)
summary(example2)
plot(example2, ylim = c(-7, -3), xlab = "ID (Sample)", 
	ylab = expression(paste(log[10], " ", Pb^{paste("2","+",sep="")} )))
## End(No test)



