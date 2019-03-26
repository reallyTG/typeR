library(ggalt)


### Name: geom_lollipop
### Title: Lollipop charts
### Aliases: geom_lollipop

### ** Examples

df <- data.frame(trt=LETTERS[1:10],
                 value=seq(100, 10, by=-10))

ggplot(df, aes(trt, value)) + geom_lollipop()

ggplot(df, aes(value, trt)) + geom_lollipop(horizontal=TRUE)



