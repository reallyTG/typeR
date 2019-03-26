library(CVD)


### Name: VKSgraphic
### Title: Graphical score for the D-15 tests
### Aliases: VKSgraphic VKSvariantGraphic
### Keywords: programming

### ** Examples

# Creating similar graphics to "A Quantitative Scoring Technique For Panel 
#Tests of Color Vision" Algis J. Vingrys and P. Ewen King-Smith
## Not run: 
##D VKSdata<-VKStable2[,c(1,3:5)]
##D VKSdata[1,1]<-'Normal no error'
##D VKSdata[2:9,1]<-'Normal'
##D VKSdata[10:13,1]<-'Acquired CVD'
##D # the graphics are similar but not identical because the data used in the 
##D #plots is the average of the values instead of all the values
##D VKSgraphic(VKSdata[,1:3],5,4,'D-15 angle vs C-index (Average)','Angle',
##D 'C-index') # Fig. 6
##D VKSgraphic(VKSdata[,c(1,2,4)],5,4,'D-15 angle vs S-index (Average)','Angle',
##D 'S-index') # Fig. 7
## End(Not run)



