library(openintro)


### Name: acs12
### Title: American Community Survey, 2012
### Aliases: acs12
### Keywords: datasets

### ** Examples

data(acs12)
d <- subset(acs12, 30 <= age & age <= 60)
d <- subset(d, employment == "employed" & income > 0)
d <- na.omit(d[c("age", "income")])

par(mfrow = c(2, 1), mar = c(5, 5, 1, 1))
plot(d$age, d$income)
m <- lm(income ~ age, data = d)
abline(m)
summary(m)

plot(d$age, log(d$income))
ml <- lm(log(income) ~ age, data = d)
abline(ml)
summary(ml)



