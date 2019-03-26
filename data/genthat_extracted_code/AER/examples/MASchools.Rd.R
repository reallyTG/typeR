library(AER)


### Name: MASchools
### Title: Massachusetts Test Score Data
### Aliases: MASchools
### Keywords: datasets

### ** Examples

## Massachusetts
data("MASchools")

## compare with California
data("CASchools")
CASchools$stratio <- with(CASchools, students/teachers)
CASchools$score4 <- with(CASchools, (math + read)/2)

## Stock and Watson, parts of Table 9.1, p. 330
vars <- c("score4", "stratio", "english", "lunch", "income")
cbind(
  CA_mean = sapply(CASchools[, vars], mean),
  CA_sd   = sapply(CASchools[, vars], sd),
  MA_mean = sapply(MASchools[, vars], mean),
  MA_sd   = sapply(MASchools[, vars], sd))

## Stock and Watson, Table 9.2, p. 332, col. (1)
fm1 <- lm(score4 ~ stratio, data = MASchools)
coeftest(fm1, vcov = vcovHC(fm1, type = "HC1"))

## More examples, notably the entire Table 9.2, can be found in:
## help("StockWatson2007")



