library(rje)


### Name: printPercentage
### Title: Print Percentage of Activity Completed to stdout
### Aliases: printPercentage printCount
### Keywords: iteration IO print

### ** Examples

x = numeric(100)

for (i in 1:100) {
  x[i] = mean(rnorm(1e5))
  printPercentage(i,100)
}


i = 0
repeat {
  i = i+1
  if (runif(1) > 0.99) {
    break
  }
  printCount(i)
}
print("\n")



