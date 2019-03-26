library(fastR2)


### Name: Students
### Title: Standardized test scores and GPAs
### Aliases: Students
### Keywords: datasets

### ** Examples


data(Students)
gf_point(ACT ~ SAT, data = Students)
gf_point(gradGPA ~ hsGPA, data = Students)




