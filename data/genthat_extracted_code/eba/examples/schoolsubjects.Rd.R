library(eba)


### Name: schoolsubjects
### Title: Preference for School Subjects
### Aliases: schoolsubjects
### Keywords: datasets

### ** Examples

data(schoolsubjects)

m <- lapply(schoolsubjects, eba)  # Bradley-Terry-Luce (BTL) model

par(mfrow = 1:2)
dotchart(uscale(m$boys), main = "Boys' preferences",)
dotchart(uscale(m$girls), main = "Girls' preferences")
mtext("Utility scale value (BTL model)", outer = TRUE, side = 1,
      line = -2)
mtext("(Kendall and Babington Smith, 1940)", outer = TRUE, line = -4)



