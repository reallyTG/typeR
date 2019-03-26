library(iDOS)


### Name: create.training.validation.split
### Title: create.training.validation.split
### Aliases: create.training.validation.split
### Keywords: output

### ** Examples


# load test data
x <- get.test.data(data.types = c("mRNA.T", "ann"));

# create training and validation sets
partitioned.datasets <- create.training.validation.split(
  exp.data = x$mRNA.T$BLCA, 
  ann.data = x$ann$BLCA, 
  seed.number = 51214
  );




