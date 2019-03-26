library(Bchron)


### Name: choosePositions
### Title: Compute positions to date next which result in maximal decrease
###   of chronological uncertainty
### Aliases: choosePositions

### ** Examples

## No test: 
data(Glendalough)
GlenOut = Bchronology(ages=Glendalough$ages,
                      ageSds=Glendalough$ageSds,
                      calCurves=Glendalough$calCurves,
                      positions=Glendalough$position,
                      positionThicknesses=Glendalough$thickness,
                      ids=Glendalough$id,
                      predictPositions=seq(0,1500,by=10))

# Find out which two positions (depths) to date if we have room for two more dates
# Here going to choose 3 new positions to date
newPositions = choosePositions(GlenOut, N = 3)
print(newPositions)
## End(No test)



