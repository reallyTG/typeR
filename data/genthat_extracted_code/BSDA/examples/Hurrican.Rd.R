library(BSDA)


### Name: Hurrican
### Title: Number of storms, hurricanes and El Nino effects from 1950
###   through 1995
### Aliases: Hurrican
### Keywords: datasets

### ** Examples


T1 <- xtabs(~hurrican, data = Hurrican)
T1
barplot(T1, col = "blue", main = "Problem 1.38",
        xlab = "Number of hurricanes", 
        ylab = "Number of seasons")
boxplot(storms ~ elnino, data = Hurrican, 
        col = c("blue", "yellow", "red"))
anova(lm(storms ~ elnino, data = Hurrican))
rm(T1)




