library(BSDA)


### Name: Hodgkin
### Title: Results of treatments for Hodgkin's disease
### Aliases: Hodgkin
### Keywords: datasets

### ** Examples


T1 <- xtabs(~type + response, data = Hodgkin)
T1
barplot(t(T1), legend = TRUE, beside = TRUE)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Hodgkin, aes(x = type, fill = response)) + 
##D            geom_bar(position = "dodge") + 
##D            theme_bw()
## End(Not run)




