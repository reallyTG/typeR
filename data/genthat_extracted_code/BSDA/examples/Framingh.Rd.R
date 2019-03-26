library(BSDA)


### Name: Framingh
### Title: Cholesterol values of 62 subjects in the Framingham Heart Study
### Aliases: Framingh
### Keywords: datasets

### ** Examples


stem(Framingh$cholest)
boxplot(Framingh$cholest, horizontal = TRUE)
hist(Framingh$cholest, freq = FALSE)
lines(density(Framingh$cholest))
mean(Framingh$cholest > 200 & Framingh$cholest < 240)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Framingh, aes(x = factor(1), y = cholest)) + 
##D   geom_boxplot() +                 # boxplot
##D   labs(x = "") +                   # no x label  
##D   theme_bw() +                     # black and white theme  
##D   geom_jitter(width = 0.2) +       # jitter points
##D   coord_flip()                     # Create horizontal plot
##D ggplot2::ggplot(data = Framingh, aes(x = cholest, y = ..density..)) +
##D   geom_histogram(fill = "pink", binwidth = 15, color = "black") + 
##D   geom_density() + 
##D   theme_bw()
## End(Not run)




