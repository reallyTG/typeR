library(openintro)


### Name: county
### Title: United States Counties
### Aliases: county
### Keywords: datasets

### ** Examples

data(county)

p00 <- county$pop2000
p10 <- county$pop2010
hist((p10 - p00)/p00)



