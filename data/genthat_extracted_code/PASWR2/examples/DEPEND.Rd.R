library(PASWR2)


### Name: DEPEND
### Title: Number of Dependent Children for 50 Families
### Aliases: DEPEND
### Keywords: datasets

### ** Examples

xtabs(~number, data = DEPEND)
ggplot(data = DEPEND, aes(x = factor(number))) + 
geom_bar(fill = "cornsilk", color = "orange") + labs(x = "Number of Dependent Children")
ggplot(data = DEPEND, aes(x = number)) + geom_density(fill = "pink", alpha = 0.3, 
color = "red") + labs(x = "Number of Dependent Children")



