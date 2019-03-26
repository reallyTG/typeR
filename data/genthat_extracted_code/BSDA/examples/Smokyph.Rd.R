library(BSDA)


### Name: Smokyph
### Title: Water pH levels of 75 water samples taken in the Great Smoky
###   Mountains
### Aliases: Smokyph
### Keywords: datasets

### ** Examples


summary(Smokyph$waterph)
tapply(Smokyph$waterph, Smokyph$code, mean)
stripchart(waterph ~ code, data = Smokyph, method = "stack",
           pch = 19, col = c("red", "blue"))
           t.test(Smokyph$waterph, mu = 7)
           SIGN.test(Smokyph$waterph, md = 7)
           t.test(waterph ~ code, data = Smokyph, alternative = "less")
           t.test(waterph ~ code, data = Smokyph, conf.level = 0.90)
 ## Not run: 
##D  library(ggplot2)
##D  ggplot2::ggplot(data = Smokyph, aes(x = waterph, fill = code)) + 
##D             geom_dotplot() + 
##D             facet_grid(code ~ .) + 
##D             guides(fill = FALSE)
## End(Not run)




