library(BSDA)


### Name: Family
### Title: Size of family versus cost per person per week for groceries
### Aliases: Family
### Keywords: datasets

### ** Examples


plot(cost ~ number, data = Family)
abline(lm(cost ~ number, data = Family), col = "red")
cor(Family$cost, Family$number)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Family, aes(x = number, y = cost)) + 
##D            geom_point() + 
##D            geom_smooth(method = "lm") + 
##D            theme_bw()
## End(Not run)




