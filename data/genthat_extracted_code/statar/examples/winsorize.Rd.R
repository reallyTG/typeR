library(statar)


### Name: winsorize
### Title: Winsorize a numeric vector
### Aliases: winsorize winsorise

### ** Examples

                         
v <- c(1:4, 99)
winsorize(v)
winsorize(v, replace = NA)
winsorize(v, probs = c(0.01, 0.99))
winsorize(v, cutpoints = c(1, 50))



