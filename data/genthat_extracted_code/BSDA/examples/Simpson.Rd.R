library(BSDA)


### Name: Simpson
### Title: Grade point averages of men and women participating in various
###   sports-an illustration of Simpson's paradox
### Aliases: Simpson
### Keywords: datasets

### ** Examples


boxplot(gpa ~ gender, data = Simpson, col = "violet")
boxplot(gpa ~ sport, data = Simpson, col = "lightgreen")
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Simpson, aes(x = gender, y = gpa, fill = gender)) +
##D            geom_boxplot() + 
##D            facet_grid(.~sport) + 
##D            theme_bw()
## End(Not run)



