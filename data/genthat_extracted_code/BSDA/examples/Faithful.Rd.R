library(BSDA)


### Name: Faithful
### Title: Waiting times between successive eruptions of the Old Faithful
###   geyser
### Aliases: Faithful
### Keywords: datasets

### ** Examples


t.test(time ~ eruption, data = Faithful)
hist(Faithful$time, xlab = "wait time", main = "", freq = FALSE)
lines(density(Faithful$time))

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Faithful, aes(x = time, y = ..density..)) + 
##D            geom_histogram(binwidth = 5, fill = "pink", col = "black") + 
##D            geom_density() + 
##D            theme_bw() + 
##D            labs(x = "wait time")
## End(Not run)



