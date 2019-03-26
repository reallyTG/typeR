library(psyosphere)


### Name: dir_add_csv
### Title: Bind CSV data to data frame
### Aliases: dir_add_csv

### ** Examples

data(psyo)
csv_dir <- system.file("extdata", "ids.csv", package = "psyosphere")
psyo <- dir_add_csv(psyo, csv_dir)



