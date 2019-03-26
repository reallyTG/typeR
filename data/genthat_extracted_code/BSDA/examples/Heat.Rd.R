library(BSDA)


### Name: Heat
### Title: Primary heating sources of homes on indian reservations versus
###   all households
### Aliases: Heat
### Keywords: datasets

### ** Examples


T1 <- xtabs(~ fuel + location, data = Heat)
T1
barplot(t(T1), beside = TRUE, legend = TRUE)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Heat, aes(x = fuel, fill = location)) + 
##D            geom_bar(position = "dodge") + 
##D            labs(y = "percent") + 
##D            theme_bw() + 
##D            theme(axis.text.x = element_text(angle = 30, hjust = 1)) 
## End(Not run)




