library(BSDA)


### Name: Life
### Title: Life expectancy of men and women in U.S.
### Aliases: Life
### Keywords: datasets

### ** Examples


plot(men ~ year, type = "l", ylim = c(min(men, women), max(men, women)), 
    col = "blue", main = "Life Expectancy vs Year", ylab = "Age", 
    xlab = "Year", data = Life)
lines(women ~ year, col = "red", data = Life)
text(1955, 65, "Men", col = "blue")
text(1955, 70, "Women", col = "red")




