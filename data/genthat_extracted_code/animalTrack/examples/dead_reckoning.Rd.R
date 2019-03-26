library(animalTrack)


### Name: dead_reckoning
### Title: Create a course steered and course made good using the
###   principles of navigation by dead reckoning.
### Aliases: dead_reckoning

### ** Examples


## Import the "missionbay2" dataset. See help(missionbay2)
## for full documentation.
data(missionbay2)

trial.1 <- missionbay2[missionbay2$trial == 1,]
trial.2 <- missionbay2[missionbay2$trial == 2,]
trial.3 <- missionbay2[missionbay2$trial == 3,]
trial.4 <- missionbay2[missionbay2$trial == 4,]

## Calculate the course made good for the four trials. Each returns
## to the starting position.
CS1 <- dead_reckoning(trial.1$speed, trial.1$heading_geo,angle="radian")
CS2 <- dead_reckoning(trial.2$speed, trial.2$heading_geo,angle="radian")
CS3 <- dead_reckoning(trial.3$speed, trial.3$heading_geo,angle="radian")
CS4 <- dead_reckoning(trial.4$speed, trial.4$heading_geo,angle="radian")

## Plot the course steered for each trial.
plot(CS1$CSx,CS1$CSy,type='l',col='blue',xlab="X-coordinate (unprojected)",
     ylab="Y-coordinate (unprojected)",ylim=c(-400,150))
lines(CS2$CSx,CS2$CSy,col='green')
lines(CS3$CSx,CS3$CSy,col='red')
lines(CS4$CSx,CS4$CSy,col='magenta')
legend(-300,100,legend=c("Run1","Run2","Run3","Run4"),col=c("blue","green",
       "red","magenta"),lty=c(1,1,1,1),bty="n")
title('Course Steered for Mission Bay Trials')
grid()

## Plot the course steered vs. course made good
plot(CS1$CSx,CS1$CSy,type='l',col='blue',xlab="X-coordinate (unprojected)",
     ylab="Y-coordinate (unprojected)",ylim=c(-400,150))
lines(CS1$CMGx,CS1$CMGy,col='black')
t.set <- paste("Track 1, Set Angle: ",as.character(round(CS1$set*(180/pi),2)))
t.drift <- paste("Track 1, Drift: ",as.character(round(CS1$drift,2))," m/s")
t.error <- paste("Track 1, Error Distance: ",as.character(round(CS1$errordistance,2))," m")
title(paste(t.set,"\n",t.drift,"\n",t.error))
legend(-300,100,legend=c("Course Steered","Course Made Good"),
       col=c("blue","black"),lty=c(1,1),bty="n")
grid()




