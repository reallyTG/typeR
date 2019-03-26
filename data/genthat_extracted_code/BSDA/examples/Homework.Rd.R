library(BSDA)


### Name: Homework
### Title: Number of hours per week spent on homework for private and
###   public high school students
### Aliases: Homework
### Keywords: datasets

### ** Examples


boxplot(time ~ school, data = Homework, 
        ylab = "Hours per week spent on homework")
#
t.test(time ~ school, data = Homework)




