library(nullabor)


### Name: box_dist
### Title: Distance based on side by side Boxplots
### Aliases: box_dist

### ** Examples

if(require('dplyr')) {
  with(mtcars,
    box_dist(data.frame(as.factor(am), mpg),
    data.frame(as.factor(sample(am)), mpg))
  )
}



