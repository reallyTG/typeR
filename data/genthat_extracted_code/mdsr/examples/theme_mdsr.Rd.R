library(mdsr)


### Name: theme_mdsr
### Title: MDSR themes
### Aliases: theme_mdsr

### ** Examples


p <- ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl))) + 
  geom_point() + facet_wrap(~ am) + geom_smooth()
p + theme_grey()
p + theme_mdsr()



