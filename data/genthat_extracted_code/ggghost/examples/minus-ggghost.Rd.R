library(ggghost)


### Name: -.gg
### Title: Remove a call from a ggghost object
### Aliases: -.gg

### ** Examples

## create a ggghost object
tmpdata <- data.frame(x = 1:100, y = rnorm(100))

z %g<% ggplot(tmpdata, aes(x,y))
z <- z + geom_point(col = "steelblue")
z <- z + theme_bw()
z <- z + labs(title = "My cool ggplot")
z <- z + labs(x = "x axis", y = "y axis")
z <- z + geom_smooth()

## remove the geom_smooth
z - geom_smooth()

## remove the labels
## NOTE: argument must be present and able to be 
## evaluated in scope
z - labs(TRUE) # works
z - labs(title) # works because of title(), but removes all labs()



