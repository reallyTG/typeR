library(Hotelling)


### Name: hotelling.stat
### Title: Calculate Hotelling's two sample T-squared test statistic
### Aliases: hotelling.stat hotel.stat
### Keywords: htest

### ** Examples


data(container.df)
split.data = split(container.df[,-1],container.df$gp)
x = split.data[[1]]
y = split.data[[2]]
hotelling.stat(x, y)
hotelling.stat(x, y, TRUE)




