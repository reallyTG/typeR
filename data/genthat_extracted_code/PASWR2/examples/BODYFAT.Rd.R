library(PASWR2)


### Name: BODYFAT
### Title: Body Fat Composition
### Aliases: BODYFAT
### Keywords: datasets

### ** Examples

# base graphics
boxplot(fat ~ sex, data = BODYFAT)
# ggplot2 approach
ggplot(data=BODYFAT, aes(x = sex, y = fat, fill = sex)) + geom_boxplot() + 
labs(x = "",y = "Percent body fat") + scale_x_discrete(breaks=c("F", "M"), 
labels =c("Female", "Male")) + guides(fill = FALSE) + 
scale_fill_manual(values = c("red", "green"))
# Brewer Colors
ggplot(data=BODYFAT, aes(x = sex, y = fat, fill = sex)) + geom_boxplot() + 
labs(x = "", y = "Percent body fat") + scale_x_discrete(breaks=c("F", "M"), 
labels =c("Female", "Male")) + guides(fill = FALSE) + scale_fill_brewer()
ggplot(data=BODYFAT, aes(x = fat, fill = sex)) + geom_density(alpha = 0.4) + 
scale_fill_brewer() 



