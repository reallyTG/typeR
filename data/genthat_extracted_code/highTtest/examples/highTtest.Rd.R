library(highTtest)


### Name: highTtest
### Title: Simultaneous critical values for t-tests in very high dimensions
### Aliases: highTtest plot,highTtest vennD,highTtest CK,highTtest
###   ST,highTtest BH,highTtest pi_alt,highTtest pvalue,highTtest CK ST BH
###   pi_alt pvalue

### ** Examples

set.seed(123)
x1 <- matrix(c(runif(500),runif(500,0.25,1)),nrow=100)
obj <- highTtest(dataSet1=x1[,1:5], 
                 dataSet2=x1[,6:10], 
                 gammas=seq(0.1,1,0.1),
                 tSequence=seq(0.001,3,0.001))

#Print number of significant features identified in each method
colSums(CK(obj))
colSums(ST(obj))
colSums(BH(obj))

#Plot the number of significant features identified in each method
plot(obj, main="Example plot")
ltry <- try(library(colorfulVennPlot),silent=TRUE)

if( !is(ltry,"try-error") ) vennD(obj, 0.8, Title="Example vennD")

#Proportion of alternative hypotheses
pi_alt(obj)

#p-values
pvalue(obj)




