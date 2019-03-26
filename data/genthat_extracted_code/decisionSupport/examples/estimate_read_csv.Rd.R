library(decisionSupport)


### Name: estimate_read_csv
### Title: Read an Estimate from CSV - File.
### Aliases: estimate_read_csv estimate_read_csv_old

### ** Examples

 # Read the joint estimate information for the variables "sales", "productprice" and 
 # "costprice" from file:
 ## Get the path to the file with the marginal information:
 marginalFilePath=system.file("extdata","profit-4.csv",package="decisionSupport")
 ## Read the marginal information from file "profit-4.csv" and print it to the screen as
 ## illustration:
 read.csv(marginalFilePath, strip.white=TRUE)
 ## Read the correlation information from file "profit-4_cor.csv" and print it to the screen as
 ## illustration: 
 read.csv(gsub(".csv","_cor.csv",marginalFilePath), row.names=1)
 ## Now read marginal and correlation file straight into an estimate:
 parameterEstimate<-estimate_read_csv(fileName=marginalFilePath)
 print(parameterEstimate)



