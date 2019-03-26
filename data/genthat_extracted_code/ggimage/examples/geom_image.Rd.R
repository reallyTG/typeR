library(ggimage)


### Name: geom_image
### Title: geom_image
### Aliases: geom_image

### ** Examples

library("ggplot2")
library("ggimage")
set.seed(2017-02-21)
d <- data.frame(x = rnorm(10),
                y = rnorm(10),
                image = sample(c("https://www.r-project.org/logo/Rlogo.png",
                                "https://jeroenooms.github.io/images/frink.png"),
                              size=10, replace = TRUE)
               )
ggplot(d, aes(x, y)) + geom_image(aes(image=image))



