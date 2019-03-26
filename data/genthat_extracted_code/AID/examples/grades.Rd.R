library(AID)


### Name: grades
### Title: Student Grades Data
### Aliases: grades
### Keywords: datasets

### ** Examples


library(AID)

data(grades)
hist(grades[,1])
out <- boxcoxnc(grades[,1])
confInt(out, level = 0.95)




