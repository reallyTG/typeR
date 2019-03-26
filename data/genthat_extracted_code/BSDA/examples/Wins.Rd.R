library(BSDA)


### Name: Wins
### Title: Baseball team wins versus seven independent variables for
###   National league teams in 1990
### Aliases: Wins
### Keywords: datasets

### ** Examples


plot(wins ~ era, data = Wins)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Wins, aes(x = era, y = wins)) + 
##D            geom_point() + 
##D            geom_smooth(method = "lm", se = FALSE) + 
##D            theme_bw()
## End(Not run)




