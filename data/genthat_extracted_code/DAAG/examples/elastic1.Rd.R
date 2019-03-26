library(DAAG)


### Name: elastic1
### Title: Elastic Band Data Replicated
### Aliases: elastic1
### Keywords: datasets

### ** Examples

plot(elastic1)

print("Inline Functions - Example 12.2.2")
sapply(elastic1, mean)
pause()

sapply(elastic1, function(x)mean(x))
pause()

sapply(elastic1, function(x)sum(log(x)))
pause()

print("Data Output - Example 12.3.2")
write.table(elastic1, file="bandsframe.txt")




