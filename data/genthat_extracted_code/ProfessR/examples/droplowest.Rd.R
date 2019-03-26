library(ProfessR)


### Name: droplowest
### Title: Drop lowest grade
### Aliases: droplowest bestscores
### Keywords: misc

### ** Examples


#########   generate fake exam scores, 10 students, 3 exams
z = matrix(runif(3*10, 50, 100), ncol=3   )
 A  = droplowest(z)
 cbind(A$best,  A$minind, z, A$midgrade)





