library(MOTE)


### Name: d.prop
### Title: d for Independent Proportions
### Aliases: d.prop
### Keywords: effect independent prop proportions proportions, size, test,

### ** Examples


#Several researchers were examining the data on the number
#of students who retake a course after they receive a D, F,
#or withdraw from the course. They randomly sampled form
#a large university two groups of students: traditional
#(less than 25 years old) and non-traditional (25 and older).
#Each group included 100 participants. About 25% of students
#of the traditional group reported they would retake a course,
#while the non-traditional group showed about 35% would
#retake the course.

#You can type in the numbers directly as shown below,
#or refer to your dataset within the function.

    d.prop(p1 = .25, p2 = .35, n1 = 100, n2 = 100, a = .05)

    d.prop(.25, .35, 100, 100, .05)



