library(epiDisplay)


### Name: summ
### Title: Summary with graph
### Aliases: summ summ.default summ.data.frame summ.factor summ.logical
### Keywords: database

### ** Examples

data(Oswego)
.data <- Oswego
summ(.data)
with(.data, summ(age))
with(.data, summ(age, box=TRUE))
with(.data, summ(age, dot.col="brown"))
with(.data, summ(age, by=sex))
# Changing dot colours
with(.data, summ(age, by=sex, dot.col = c("blue","orange")))
# Enlarging main title and other elements
with(.data, summ(age, by=sex, cex.main=1.5, cex.X.axis=1.5, cex.Y.axis=1.7))

# Free vector
summ(rnorm(1000))
summ((1:100)^2, by=rep(1:2, 50))
summ((1:100)^2, by=rep(c("Odd","Even"), 50), main="Quadratic distribution by odd and even numbers")



