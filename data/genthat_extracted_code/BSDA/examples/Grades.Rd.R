library(BSDA)


### Name: Grades
### Title: Test grades in a beginning statistics class
### Aliases: Grades
### Keywords: datasets

### ** Examples


hist(Grades$grades, main = "", xlab = "Test grades", right = FALSE)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Grades, aes(x = grades, y = ..density..)) + 
##D            geom_histogram(fill = "pink", binwidth = 5, color = "black") + 
##D            geom_density(lwd = 2, color = "red") + 
##D            theme_bw() 
## End(Not run)




