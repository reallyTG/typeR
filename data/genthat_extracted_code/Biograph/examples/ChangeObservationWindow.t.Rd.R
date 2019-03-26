library(Biograph)


### Name: ChangeObservationWindow.t
### Title: Changes observation window to period between two points in time
### Aliases: ChangeObservationWindow.t

### ** Examples

 #  The following example defines observation window 
 # as period between Century Month Code (CMC) 500 and CMC 900 (survey = GLHS)
 data (GLHS)
 z <- ChangeObservationWindow.t (GLHS,starttime=500,endtime=800,covs.dates=c("marriage","LMentry"))



