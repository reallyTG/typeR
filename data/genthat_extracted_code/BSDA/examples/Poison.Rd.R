library(BSDA)


### Name: Poison
### Title: Number of poisonings reported to 16 poison control centers
### Aliases: Poison
### Keywords: datasets

### ** Examples


T1 <- xtabs(~type, data = Poison)
T1
par(mar = c(5.1 + 2, 4.1, 4.1, 2.1))
barplot(sort(T1, decreasing = TRUE), las = 2, col = rainbow(6))
par(mar = c(5.1, 4.1, 4.1, 2.1))
rm(T1)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Poison, aes(x = type, fill = type)) + 
##D            geom_bar() + 
##D            theme_bw() + 
##D            theme(axis.text.x  = element_text(angle = 85, vjust = 0.5)) +
##D            guides(fill = FALSE)
## End(Not run)




