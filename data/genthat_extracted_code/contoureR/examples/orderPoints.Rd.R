library(contoureR)


### Name: orderPoints
### Title: Order Points Clockwise or Counter-Clockwise
### Aliases: orderPoints

### ** Examples

#Generate a random set of points and put them clockwise order
set.seed(1)
x  = runif(100)
y  = runif(100)
op    = orderPoints(x,y)

#To demonstrate, Lets view the points in order
library(ggplot2)
df    = data.frame(x,y)
df    = df[op,];
df$id = 1:nrow(df)
ggplot(data=df,aes(x,y,colour=id)) +
    geom_path() + geom_point() +
    scale_colour_gradient(low="green",high="red")



