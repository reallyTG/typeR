library(BSDA)


### Name: Board
### Title: Incomes of board members from three different universities
### Aliases: Board
### Keywords: datasets

### ** Examples


boxplot(salary ~ university, data = Board, col = c("red", "blue", "green"), 
        ylab = "Income")
tapply(Board$salary, Board$university, summary)
anova(lm(salary ~ university, data = Board))
## Not run: 
##D library(dplyr)
##D dplyr::group_by(Board, university) %>%
##D          summarize(Average = mean(salary))
## End(Not run)



