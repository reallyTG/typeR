library(BSDA)


### Name: Teacher
### Title: Average teacher's salaries across the states in the 70s 80s and
###   90s
### Aliases: Teacher
### Keywords: datasets

### ** Examples


par(mfrow = c(3, 1))
hist(Teacher$salary[Teacher$year == "1973-74"],
     main = "Teacher salary 1973-74", xlab = "salary",
     xlim = range(Teacher$salary, na.rm = TRUE))
hist(Teacher$salary[Teacher$year == "1983-84"],
     main = "Teacher salary 1983-84", xlab = "salary",
     xlim = range(Teacher$salary, na.rm = TRUE))
hist(Teacher$salary[Teacher$year == "1993-94"],
     main = "Teacher salary 1993-94", xlab = "salary",
     xlim = range(Teacher$salary, na.rm = TRUE))
par(mfrow = c(1, 1))
## Not run: 
##D    
##D library(ggplot2)                    
##D     ggplot2::ggplot(data = Teacher, aes(x = salary)) + 
##D                geom_histogram(fill = "purple", color = "black") +  
##D                facet_grid(year ~ .) + 
##D                theme_bw()
## End(Not run)




