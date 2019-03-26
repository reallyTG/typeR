library(BSDA)


### Name: Governor
### Title: Annual salaries for state governors in 1994 and 1999
### Aliases: Governor
### Keywords: datasets

### ** Examples


boxplot(salary ~ year, data = Governor)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Governor, aes(x = salary)) + 
##D            geom_density(fill = "pink") + 
##D            facet_grid(year ~ .) + 
##D            theme_bw()
## End(Not run)




