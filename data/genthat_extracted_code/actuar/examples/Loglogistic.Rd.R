library(actuar)


### Name: Loglogistic
### Title: The Loglogistic Distribution
### Aliases: Loglogistic dllogis pllogis qllogis rllogis mllogis levllogis
### Keywords: distribution

### ** Examples

exp(dllogis(2, 3, 4, log = TRUE))
p <- (1:10)/10
pllogis(qllogis(p, 2, 3), 2, 3)

## mean
mllogis(1, 2, 3)

## case with 1 - order/shape > 0
levllogis(10, 2, 3, order = 1)

## case with 1 - order/shape < 0
levllogis(10, 2/3, 3, order = 1)



