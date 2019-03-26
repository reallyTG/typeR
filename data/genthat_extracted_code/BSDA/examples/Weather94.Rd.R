library(BSDA)


### Name: Weather94
### Title: Weather casualties in 1994
### Aliases: Weather94
### Keywords: datasets

### ** Examples


T1 <- xtabs(~type, data = Weather94)
T1
par(mar = c(5.1 + 2, 4.1 - 1, 4.1 - 2, 2.1))
barplot(sort(T1, decreasing = TRUE), las = 2, col = rainbow(11))
par(mar = c(5.1, 4.1, 4.1, 2.1))
## Not run: 
##D library(ggplot2)
##D T2 <- as.data.frame(T1)
##D T2
##D ggplot2::ggplot(data =T2, aes(x = reorder(type, Freq), y = Freq)) + 
##D            geom_bar(stat = "identity", fill = "purple") +
##D            theme_bw() + 
##D            theme(axis.text.x  = element_text(angle = 55, vjust = 0.5)) + 
##D            labs(x = "", y = "count")
## End(Not run)




