library(BSDA)


### Name: Sophomor
### Title: Grade point averages, SAT scores and final grade in college
###   algebra for 20 sophomores
### Aliases: Sophomor
### Keywords: datasets

### ** Examples


cor(Sophomor)
plot(exam ~ gpa, data = Sophomor)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Sophomor, aes(x = gpa, y = exam)) + 
##D            geom_point()
##D            ggplot2::ggplot(data = Sophomor, aes(x = sat, y = exam)) + 
##D            geom_point()
## End(Not run)




