library(bibliometrix)


### Name: authorProdOverTime
### Title: Top-Authors' Productivity over the Time
### Aliases: authorProdOverTime

### ** Examples

data(scientometrics)
res <- authorProdOverTime(scientometrics, k=10)
print(res$dfAU)
plot(res$graph)




