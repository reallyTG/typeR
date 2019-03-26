library(JWileymisc)


### Name: APAStyler.SEMSummary
### Title: A generic function for pretty printing in (semi) APA Style
### Aliases: APAStyler.SEMSummary

### ** Examples

m <- SEMSummary(~., data = mtcars)
APAStyler(m, type = "cor", stars = FALSE, file = FALSE)
APAStyler(m, type = "cov", stars = FALSE, file = FALSE)
APAStyler(m, type = "both", stars = FALSE, file = FALSE)
APAStyler(m, type = "cor", stars = TRUE, file = FALSE)
APAStyler(m, type = "cov", stars = TRUE, file = FALSE)
APAStyler(m, type = "both", stars = TRUE, file = FALSE)



