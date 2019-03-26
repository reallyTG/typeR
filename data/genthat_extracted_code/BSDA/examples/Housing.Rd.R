library(BSDA)


### Name: Housing
### Title: Median home prices for 1984 and 1993 in 37 markets across the
###   U.S.
### Aliases: Housing
### Keywords: datasets

### ** Examples


stripchart(price ~ year, data = Housing, method = "stack", 
           pch = 1, col = c("red", "blue"))
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Housing, aes(x = price, fill = year)) + 
##D            geom_dotplot() + 
##D            facet_grid(year ~ .) + 
##D            theme_bw()
## End(Not run)               




