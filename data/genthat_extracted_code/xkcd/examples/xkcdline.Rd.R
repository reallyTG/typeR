library(xkcd)


### Name: xkcdline
### Title: Draw lines or circunferences
### Aliases: xkcdline
### Keywords: manip

### ** Examples

data <- data.frame(x1=c(1,2), y1=c(10,20), xend=c(2.5,0.5),
yend=c(20,10), model=c("low","high"))

ggplot() + xkcdline(mapping=aes(x=x1 +y1, y=y1, xend =xend, yend= yend,
color = model), data=data)

ggplot() + xkcdline(mapping=aes(x=x1 +y1, y=y1, xend =xend, yend= yend,
color = model), data=data) + facet_grid(. ~ model)

ggplot() + xkcdline(mapping=aes(x=x1 +y1, y=y1, diameter =xend), data=data, type="circunference")



