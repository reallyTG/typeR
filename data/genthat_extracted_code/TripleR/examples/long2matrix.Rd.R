library(TripleR)


### Name: long2matrix
### Title: Convert long format to a quadratic matrix
### Aliases: long2matrix

### ** Examples


#load a data set in long style
data("multiGroup")

str(multiGroup)
qm <- long2matrix(ex~perceiver.id*target.id|group.id, multiGroup)
qm[[2]]

# we see some warnings that some persons are only actors or only partners. 
# Let's check the data without removing them:
qm2 <- long2matrix(ex~perceiver.id*target.id|group.id, multiGroup, reduce=FALSE)
qm2[[2]]
 



