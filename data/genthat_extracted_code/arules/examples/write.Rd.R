library(arules)


### Name: write
### Title: Write Transactions or Associations to a File
### Aliases: write write.csv write.table write,transactions-method
###   write,associations-method write,ANY-method
### Keywords: file

### ** Examples

data("Epub")

## write the formated transactions to screen (basket format)
write(head(Epub))

## write the formated transactions to screen (single format)
write(head(Epub), format="single")

## write the formated result to file in CSV format
write(Epub, file = "data.csv", format="single", sep = ",")

## write rules in CSV format
rules <- apriori(Epub, parameter=list(support=0.0005, conf=0.8))
write(rules, file = "data.csv", sep = ",")

unlink("data.csv") # tidy up



