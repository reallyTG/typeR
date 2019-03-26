library(PASWR2)


### Name: ENGINEER
### Title: Engineers' Salaries
### Aliases: ENGINEER
### Keywords: datasets

### ** Examples

ggplot(data = ENGINEER, aes(x = university, y = salary, fill = university)) + 
geom_boxplot() + guides(fill = FALSE) + scale_fill_brewer() + 
labs(y = "salary 10 years after graduation \n in thousands of dollars")
# Violin Plots
ggplot(data = ENGINEER, aes(x = university, y = salary, fill = university)) + 
geom_violin() + guides(fill = FALSE) + scale_fill_brewer() + 
labs(y = "salary 10 years after graduation \n in thousands of dollars")



