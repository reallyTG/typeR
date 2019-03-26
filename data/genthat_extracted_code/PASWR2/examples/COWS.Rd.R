library(PASWR2)


### Name: COWS
### Title: Butterfat of Cows
### Aliases: COWS
### Keywords: datasets

### ** Examples

ggplot(data = COWS, aes(x = breed, y = butterfat, fill = age)) + 
geom_boxplot(position = position_dodge(1.0)) + 
labs(x = "", y = "Average butterfat percentage") + scale_fill_brewer()
summary(aov(butterfat ~ breed + age, data = COWS))



