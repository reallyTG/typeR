library(rotations)


### Name: drill
### Title: Drill data set
### Aliases: drill
### Keywords: datasets

### ** Examples

#Load dataset into workspace
data(drill)

#Estimate central orientation of the first subect's wrist
Subject1Wrist <- subset(drill, Subject == 1 & Joint == "Wrist")
Qs <- as.Q4(Subject1Wrist[,5:8])
mean(Qs)

#Plot Subject 1's wrist measurements using the connection to rotation matrices
## Not run: 
##D plot(Qs, col = c(1, 2, 3))
## End(Not run)

#Translate the quaternion measurements into rotations and estimate 
#the central orientation in terms of rotations
Rs <- as.SO3(Qs)
mean(Rs)



