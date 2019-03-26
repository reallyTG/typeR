library(pitchRx)


### Name: interactiveFX
### Title: Use rgl to visualize PITCHf/x
### Aliases: interactiveFX

### ** Examples

data(pitches)
Rivera <- subset(pitches, pitcher_name=="Mariano Rivera")
## Not run: 
##D  interactiveFX(Rivera, interval=.05)
##D  interactiveFX(Rivera, avg.by="pitch_types")
##D  
## End(Not run)



