library(CoxPhLb)


### Name: station.test
### Title: Test the Stationarity Assumption
### Aliases: station.test

### ** Examples

# Check the Stationarity Assumption
stest1 <- station.test(ExampleData1$a, ExampleData1$y-ExampleData1$a, ExampleData1$delta,
         print.out=TRUE)
print(stest1) 			# display the results

stest2 <- station.test(ExampleData2$a, ExampleData2$y-ExampleData2$a, ExampleData2$delta,
         print.out=TRUE)
print(stest2)   		# display the results



