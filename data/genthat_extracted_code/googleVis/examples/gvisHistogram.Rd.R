library(googleVis)


### Name: gvisHistogram
### Title: Google Histogram Chart with R
### Aliases: gvisHistogram
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.


hist1 <- gvisHistogram(dino)
plot(hist1)

## Histogram of the top 20 countries
pop <- Population[1:20,c("Country", "Population")]
pop=transform(pop, Population=round(Population/1e6))

hist2 <- gvisHistogram(pop, option=list(title="Country Populations",
                                    legend="{ position: 'none' }",
                                    colors="['green']"))
plot(hist2)
                                    
set.seed(123)
dat=data.frame(A=rpois(100, 20), 
               B=rpois(100, 5), 
               C=rpois(100, 50))
hist3 <- gvisHistogram(dat, options=list(
                       legend="{ position: 'top', maxLines: 2 }",
                       colors="['#5C3292', '#1A8763', '#871B47']"))

plot(hist3)



