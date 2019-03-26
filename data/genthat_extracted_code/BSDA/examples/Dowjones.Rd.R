library(BSDA)


### Name: Dowjones
### Title: Closing yearend Dow Jones Industrial averages from 1896 through
###   2000
### Aliases: Dowjones
### Keywords: datasets

### ** Examples


plot(close ~ year, data = Dowjones, type = "l", main = "Exercise 1.35")
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Dowjones, aes(x = year, y = close)) +
##D            geom_point(size = 0.5) + 
##D            geom_line(color = "red") + 
##D            theme_bw() + 
##D            labs(y = "Dow Jones Closing Price")
## End(Not run)



