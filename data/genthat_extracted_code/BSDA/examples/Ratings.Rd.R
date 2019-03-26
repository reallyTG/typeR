library(BSDA)


### Name: Ratings
### Title: Grade point averages versus teacher's ratings
### Aliases: Ratings
### Keywords: datasets

### ** Examples


boxplot(gpa ~ rating, data = Ratings, xlab = "Student rating of instructor", 
        ylab = "Student GPA")
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Ratings, aes(x = rating, y = gpa, fill = rating)) +
##D            geom_boxplot() + 
##D            theme_bw() + 
##D            theme(legend.position = "none") + 
##D            labs(x = "Student rating of instructor", y = "Student GPA")
## End(Not run)




