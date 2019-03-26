library(ggghost)


### Name: summary.ggghost
### Title: List the calls contained in a ggghost object
### Aliases: summary.ggghost

### ** Examples

## present the ggghost object as a list
tmpdata <- data.frame(x = 1:100, y = rnorm(100))

z %g<% ggplot(tmpdata, aes(x,y))
z <- z + geom_point(col = "steelblue")
summary(z)

## present the ggghost object as a string
summary(z, combine = TRUE) # Note, value of 'combine' is arbitrary

## to inspect the data structure also captured, use str()
str(z)



