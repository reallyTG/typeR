library(PASWR2)


### Name: GROCERY
### Title: Grocery Spending
### Aliases: GROCERY
### Keywords: datasets

### ** Examples

with(data = GROCERY, 
z.test(amount, sigma.x = 25, mu = 100, alternative = "greater"))
hist(GROCERY$amount, xlab = "Weekly grocery bill", main = "")
ggplot(data = GROCERY, aes(x = amount, y = ..density..)) + 
geom_histogram(binwidth = 8, fill = "cornsilk", color = "gray80") + 
geom_density(color = "lightblue", size = 1, fill = "lightblue", alpha = .2) + 
labs(x = "Weekly grocery bill (in dollars)")



