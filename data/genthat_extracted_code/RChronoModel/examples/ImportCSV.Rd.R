library(RChronoModel)


### Name: ImportCSV
### Title: Importing a CSV file containing the output of the MCMC algorithm
### Aliases: ImportCSV
### Keywords: CSV file

### ** Examples

  data(Events)
  write.csv(Events, "data.csv", row.names=FALSE)
  ImportCSV("data.csv")
  ImportCSV("data.csv", dec = '.', sep=',', comment.char='#', header = TRUE)



