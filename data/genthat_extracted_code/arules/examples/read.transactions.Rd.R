library(arules)


### Name: read.transactions
### Title: Read Transaction Data
### Aliases: read.transactions
### Keywords: file

### ** Examples

## create a demo file using basket format for the example
data <- paste(
  "# this is some test data", 
  "item1, item2", 
  "item1", 
  "item2, item3", 
  sep="\n")
cat(data)
write(data, file = "demo_basket")

## read demo data (skip comment line)
tr <- read.transactions("demo_basket", format = "basket", sep=",", skip = 1)
inspect(tr)


## create a demo file using single format for the example
## column 1 contains the transaction ID and column 2 contains one item
data <- paste(
  "trans1 item1", 
  "trans2 item1",
  "trans2 item2", 
  sep ="\n")
cat(data)
write(data, file = "demo_single")

## read demo data
tr <- read.transactions("demo_single", format = "single", cols = c(1,2))
inspect(tr)


## tidy up
unlink("demo_basket")
unlink("demo_single")



