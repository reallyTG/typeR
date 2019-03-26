library(nullabor)


### Name: sep_dist
### Title: Distance based on separation of clusters
### Aliases: sep_dist

### ** Examples

if(require('fpc')) {
with(mtcars, sep_dist(data.frame(wt, mpg, as.numeric(as.factor(mtcars$cyl))),
              data.frame(sample(wt), mpg, as.numeric(as.factor(mtcars$cyl))),
              clustering = TRUE))
}

if (require('fpc')) {
with(mtcars, sep_dist(data.frame(wt, mpg, as.numeric(as.factor(mtcars$cyl))),
             data.frame(sample(wt), mpg, as.numeric(as.factor(mtcars$cyl))),
             nclust = 3))
}



