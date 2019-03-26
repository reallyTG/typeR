library(OpasnetUtils)


### Name: odebug
### Title: Debugging ovariables
### Aliases: odebug

### ** Examples

test <- data.frame(
  A = c("x","y","z"), 
  B = rep(c("a","b","c"), each = 3), 
  C = rep(c("1","2","3"), each = 3*3), 
  testResult = runif(1*3*3*3)
)
test <- Ovariable(
  name = "test", 
  output = test, 
  marginal = c(TRUE, TRUE, TRUE, FALSE)
)
odebug(test, variance = TRUE)



