library(fastR2)


### Name: Kids
### Title: Goals and popularity factors for school kids
### Aliases: Kids
### Keywords: datasets

### ** Examples


data(Kids)
tally(goals ~ urban.rural, data = Kids)
chisq.test(tally(~ goals + urban.rural, data = Kids))




