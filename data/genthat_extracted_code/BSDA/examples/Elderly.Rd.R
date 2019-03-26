library(BSDA)


### Name: Elderly
### Title: Percent of the population over the age of 65
### Aliases: Elderly
### Keywords: datasets

### ** Examples


with(data = Elderly, 
stripchart(x = list(percent1998, percent1985), method = "stack", pch = 19,
           col = c("red","blue"), group.names = c("1998", "1985"))
           )
with(data = Elderly, cor(percent1998, percent1985))
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Elderly, aes(x = percent1985, y = percent1998)) +
##D            geom_point() + 
##D            theme_bw()
## End(Not run)



