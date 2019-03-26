library(OIdata)


### Name: military
### Title: US Military Demographics
### Aliases: military
### Keywords: datasets military demographics

### ** Examples

data(military)
cond1 <- military$grade == "officer"
cond2 <- military$branch == "army"
cond3 <- military$gender == "female"
tabF  <- table(military$rank[cond1 & cond2 & cond3])
barplot((tabF/sum(tabF)), main = "female army officer ranks")
tabM  <- table(military$rank[cond1 & cond2 & !cond3])
barplot(tabM/sum(tabM), main = "male army officer ranks")

(tabFM <- table(military$branch, military$gender) /
          matrix(rep(table(military$branch), 2), ncol = 2))
barplot(tabFM[,1], main = "proportion female")



