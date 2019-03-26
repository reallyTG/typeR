library(grade)


### Name: grade.discreteprobability
### Title: Grade Discrete Probability Sets
### Aliases: grade.discreteprobability
### Keywords: misc

### ** Examples

# TRUE
grade.discreteprobability(c(1/2,1/2), "[.5, .5]")
# TRUE
grade.discreteprobability(NULL, "[0, .33, .17, .5]", checkcorrect=FALSE) 

# FALSE
grade.discreteprobability(NULL, "[-1, 0, 0, 1, 1]", checkcorrect=FALSE)

# TRUE
grade.discreteprobability(c(0, 1/2, 1/4, 1/4), "[0, 1/2, 1/4, 1/4]")
# FALSE
grade.discreteprobability(c(0, 1/2, 1/4, 1/4), "[0, .25, .25, .5]",
                          ordered=TRUE)

# TRUE
grade.discreteprobability(c(0, 1/2, 1/4, 1/4), "[0, .5, .25, .25]",
                          ordered=TRUE)



