library(BSDA)


### Name: Bbsalaries
### Title: Baseball salaries for members of five major league teams
### Aliases: Bbsalaries
### Keywords: datasets

### ** Examples


stripchart(salary ~ team, data = Bbsalaries, method = "stack", 
           pch = 19, col = "blue", cex = 0.75)
title(main = "Major League Salaries")




