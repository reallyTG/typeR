library(BSDA)


### Name: Undergrad
### Title: Data set describing a sample of undergraduate students
### Aliases: Undergrad
### Keywords: datasets

### ** Examples


stripchart(gpa ~ class, data = Undergrad, method = "stack", 
col = c("blue","red","green","lightblue"),
pch = 19, main = "GPA versus Class")
stripchart(gpa ~ gender, data = Undergrad, method = "stack", 
           col = c("red", "blue"), pch = 19,
           main = "GPA versus Gender")
           stripchart(sat ~ drops, data = Undergrad, method = "stack", 
           col = c("blue", "red", "green", "lightblue"),
           pch = 19, main = "SAT versus Drops")
stripchart(drops ~ gender, data = Undergrad, method = "stack", 
           col = c("red", "blue"), pch = 19, main = "Drops versus Gender")
 ## Not run: 
##D  library(ggplot2)
##D  ggplot2::ggplot(data = Undergrad, aes(x = sat, y = drops, fill = factor(drops))) + 
##D             facet_grid(drops ~.) +
##D             geom_dotplot() +
##D             guides(fill = FALSE)
## End(Not run)




