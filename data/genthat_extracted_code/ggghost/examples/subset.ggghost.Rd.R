library(ggghost)


### Name: subset.ggghost
### Title: Extract a subset of a ggghost object
### Aliases: subset.ggghost

### ** Examples

## create a ggghost object
tmpdata <- data.frame(x = 1:100, y = rnorm(100))

z %g<% ggplot(tmpdata, aes(x,y))
z <- z + geom_point(col = "steelblue")
z <- z + theme_bw()
z <- z + labs(title = "My cool ggplot")
z <- z + labs(x = "x axis", y = "y axis")
z <- z + geom_smooth()

## remove the labels and theme
subset(z, c(1,2,6))
## or
subset(z, c(TRUE,TRUE,FALSE,FALSE,FALSE,TRUE))



