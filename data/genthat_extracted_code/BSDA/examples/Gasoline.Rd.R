library(BSDA)


### Name: Gasoline
### Title: Price of regular unleaded gasoline obtained from 25 service
###   stations
### Aliases: Gasoline
### Keywords: datasets

### ** Examples


stem(Gasoline$price)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Gasoline, aes(x = factor(1), y = price)) + 
##D            geom_violin() + 
##D            geom_jitter() + 
##D            theme_bw()
## End(Not run)




