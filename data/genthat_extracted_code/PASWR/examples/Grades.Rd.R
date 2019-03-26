library(PASWR)


### Name: Grades
### Title: GPA and SAT Scores
### Aliases: Grades
### Keywords: datasets

### ** Examples

# traditional scatterplot
plot(gpa~sat, data = Grades)
# trellis scatterplot
xyplot(gpa~sat, data = Grades, type=c("p","smooth"))



