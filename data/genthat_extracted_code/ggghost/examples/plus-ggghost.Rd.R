library(ggghost)


### Name: +.gg
### Title: Add a New ggplot Component to a ggghost Object
### Aliases: +.gg

### ** Examples

#' ## create a ggghost object
tmpdata <- data.frame(x = 1:100, y = rnorm(100))

z %g<% ggplot(tmpdata, aes(x,y))
z <- z + geom_point(col = "steelblue")
z <- z + theme_bw()
z <- z + labs(title = "My cool ggplot")
z <- z + labs(x = "x axis", y = "y axis")
z <- z + geom_smooth()



