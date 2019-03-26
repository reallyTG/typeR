library(openintro)


### Name: gpa_study_hours
### Title: gpa_study_hours
### Aliases: gpa_study_hours
### Keywords: datasets

### ** Examples

data(gpa_study_hours)

#===> gap vs. study hours <===#
plot(gpa_study_hours$gpa ~ gpa_study_hours$study_hours,
    xlab = "Study hours/week", ylab = "GPA",
    pch = 20, col = COL[1,2])




