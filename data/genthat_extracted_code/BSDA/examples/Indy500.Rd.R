library(BSDA)


### Name: Indy500
### Title: Qualifying miles per hour and number of previous starts for
###   drivers in 79th Indianapolis 500 race
### Aliases: Indy500
### Keywords: datasets

### ** Examples


stripchart(qualif ~ group, data = Indy500, method = "stack",
           pch = 19, col = c("red", "blue"))
boxplot(qualif ~ group, data = Indy500)
t.test(qualif ~ group, data = Indy500)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Indy500, aes(sample = qualif)) + 
##D            geom_qq() + 
##D            facet_grid(group ~ .) + 
##D            theme_bw()
## End(Not run)




