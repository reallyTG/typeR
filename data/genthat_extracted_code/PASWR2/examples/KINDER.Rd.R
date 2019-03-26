library(PASWR2)


### Name: KINDER
### Title: Kindergarten Class
### Aliases: KINDER
### Keywords: datasets

### ** Examples

ggplot(data = KINDER, aes(x = ht, y = wt)) + geom_point(color = "blue") + 
geom_smooth(method = "lm", color = "red") + labs(x = "height in inches", 
y = "weight in pounds")



