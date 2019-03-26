library(BSDA)


### Name: Inspect
### Title: Percent of vehicles passing inspection by type inspection
###   station
### Aliases: Inspect
### Keywords: datasets

### ** Examples


T1 <- xtabs(~ station + passed, data = Inspect)
T1
barplot(T1, beside = TRUE, legend = TRUE)
chisq.test(T1)
rm(T1)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Inspect, aes(x = passed, fill = station)) + 
##D            geom_bar(position = "dodge") + 
##D            theme_bw()
## End(Not run)




