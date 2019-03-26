library(BSDA)


### Name: Sat
### Title: SAT scores, percent taking exam and state funding per student by
###   state for 1994, 1995 and 1999
### Aliases: Sat
### Keywords: datasets

### ** Examples


Sat94 <- Sat[Sat$year == 1994, ]
Sat94
Sat99 <- subset(Sat, year == 1999)
Sat99
stem(Sat99$total)
plot(total ~ percent, data = Sat99)
model <- lm(total ~ percent, data = Sat99)
abline(model, col = "blue")
summary(model)
rm(model)




