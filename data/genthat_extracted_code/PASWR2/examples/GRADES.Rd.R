library(PASWR2)


### Name: GRADES
### Title: GPA and SAT Scores
### Aliases: GRADES
### Keywords: datasets

### ** Examples

# base scatterplot
plot(gpa ~ sat, data = GRADES)
# lattice scatterplot
xyplot(gpa ~ sat, data = GRADES, type = c("p", "smooth"))
# ggplot scatterplot
ggplot(data = GRADES, aes(x = sat, y = gpa)) + geom_point() + geom_smooth()



