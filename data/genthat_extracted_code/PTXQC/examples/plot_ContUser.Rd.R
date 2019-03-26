library(PTXQC)


### Name: plot_ContUser
### Title: Plot user-defined contaminants from evidence.txt
### Aliases: plot_ContUser

### ** Examples


 data = data.frame(fc.raw.file = letters[1:3], 
                   variable = c(rep("spectralCount", 3),
                                 rep("intensity", 3),
                                 rep("above.thresh", 3),
                                 rep("score_KS", 3)),
                   value = c(10, 20, 15, 9, 21, 14, 0, 1, 1, 0.3, 0.01, 0.04))
 plot_ContUser(data, "myco", 5, "subtitle")




