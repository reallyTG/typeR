library(BSDA)


### Name: Diplomat
### Title: Parking tickets issued to diplomats
### Aliases: Diplomat
### Keywords: datasets

### ** Examples


par(las = 2, mfrow = c(2, 2))
stripchart(number ~ country, data = Diplomat, pch = 19, 
           col= "red", vertical = TRUE)
stripchart(rate ~ country, data = Diplomat, pch = 19, 
           col= "blue", vertical = TRUE) 
with(data = Diplomat, 
     barplot(number, names.arg = country, col = "red"))
with(data = Diplomat, 
     barplot(rate, names.arg = country, col = "blue"))           
par(las = 1, mfrow = c(1, 1))
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Diplomat, aes(x = reorder(country, number), 
##D                  y = number)) + 
##D            geom_bar(stat = "identity", fill = "pink", color = "black") + 
##D            theme_bw() + labs(x = "", y = "Total Number of Tickets")
##D ggplot2::ggplot(data = Diplomat, aes(x = reorder(country, rate), 
##D                  y = rate)) +
##D            geom_bar(stat = "identity", fill = "pink", color = "black") + 
##D            theme_bw() + labs(x = "", y = "Tickets per vehicle per month")
## End(Not run)



