library(blkbox)


### Name: blkbox
### Title: Train and Test datasets.
### Aliases: blkbox
### Keywords: Learning, Machine Testing Training, blkbox,

### ** Examples

## No test: 
my_data <- iris[1:100, 1:4]
my_labels <- as.character(iris[1:100, 5])
my_partition = Partition(data = my_data, labels = my_labels)
model_1 <- blkbox(data = my_partition)
## End(No test)



