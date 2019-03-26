library(ordinal)


### Name: wine
### Title: Bitterness of wine
### Aliases: wine
### Keywords: datasets

### ** Examples


head(wine)
str(wine)

## Variables 'rating' and 'response' are related in the following way:
(intervals <- seq(0,100, by = 20))
all(wine$rating == findInterval(wine$response, intervals)) ## ok

## A few illustrative tabulations:
## Table matching Table 5 in Randall (1989):
temp.contact.bottle <- with(wine, temp:contact:bottle)[drop=TRUE]
xtabs(response ~ temp.contact.bottle + judge, data = wine)

## Table matching Table 6 in Randall (1989):
with(wine, {
  tcb <- temp:contact:bottle
  tcb <- tcb[drop=TRUE]
  table(tcb, rating)
})
## or simply: with(wine, table(bottle, rating))

## Table matching Table 1 in Tutz & Hennevogl (1996):
tab <- xtabs(as.numeric(rating) ~ judge + temp.contact.bottle,
             data = wine)
colnames(tab) <-
  paste(rep(c("c","w"), each = 4), rep(c("n", "n", "y", "y"), 2),
        1:8, sep=".")
tab


## A simple model:
m1 <- clm(rating ~ temp * contact, data = wine)
summary(m1)




