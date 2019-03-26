library(decisionSupport)


### Name: row.names.estimate
### Title: Get and set attributes of an 'estimate' object.
### Aliases: row.names.estimate names.estimate corMat.estimate
###   corMat<-.estimate

### ** Examples

 # Read the joint estimate information for the variables "sales", "productprice" and 
 # "costprice" from file:
 ## Get the path to the file with the marginal information:
 marginalFilePath=system.file("extdata","profit-4.csv",package="decisionSupport")
 ## Read marginal and correlation file into an estimate:
 parameterEstimate<-estimate_read_csv(fileName=marginalFilePath)
 print(parameterEstimate)
 ## Print the names of the variables of this estimate
 print(row.names(parameterEstimate))
 ## Print the names of the columns of this estimate
  print(names(parameterEstimate))
 ## Print the full correlation matrix of this estimate
  print(corMat(parameterEstimate))



