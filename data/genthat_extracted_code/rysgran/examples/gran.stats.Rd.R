library(rysgran)


### Name: gran.stats
### Title: Statistical Analysis of Grain Size for Unconsolidated Sediments
### Aliases: gran.stats

### ** Examples


library (rysgran)
data (camargo2001)
data (sed.metric)

#Folk & Ward

gran.stats(camargo2001, output="phi", method = "folk" , verbal = FALSE)


#Folk & Ward with verbal classification

gran.stats (camargo2001, output="phi", method = "folk" , verbal = TRUE)


#Folk & Ward with geometric data and verbal classification

gran.stats (sed.metric, output="phi", method = "folk" , verbal = TRUE)


#Method of Moments with geometric data and verbal classification

gran.stats (sed.metric, output="phi", method = "moment" , verbal = TRUE)




