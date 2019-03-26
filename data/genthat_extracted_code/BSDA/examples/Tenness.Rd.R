library(BSDA)


### Name: Tenness
### Title: Tennessee self concept scores for 20 gifted high school students
### Aliases: Tenness
### Keywords: datasets

### ** Examples


hist(Tenness$score, freq= FALSE, main = "", col = "green",
xlab = "Tennessee Self-Concept Scale score")
lines(density(Tenness$score))
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Tenness, aes(x = score, y = ..density..)) + 
##D            geom_histogram(binwidth = 2, fill = "purple", color = "black") +
##D            geom_density(color = "red", fill = "pink", alpha = 0.3) + 
##D            theme_bw()
## End(Not run)




