library(BSDA)


### Name: Dogs
### Title: Rankings of the favorite breeds of dogs
### Aliases: Dogs
### Keywords: datasets

### ** Examples


cor(Dogs$ranking[Dogs$year == "1992"], Dogs$ranking[Dogs$year == "1993"])
cor(Dogs$ranking[Dogs$year == "1997"], Dogs$ranking[Dogs$year == "1998"])
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Dogs, aes(x = reorder(breed, ranking), y = ranking)) + 
##D            geom_bar(stat = "identity") + 
##D            facet_grid(year ~. ) + 
##D            theme(axis.text.x  = element_text(angle = 85, vjust = 0.5)) 
## End(Not run)



