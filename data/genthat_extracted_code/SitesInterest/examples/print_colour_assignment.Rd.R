library(SitesInterest)


### Name: print_colour_assignment
### Title: Prints a summary table of results from the different criteria
### Aliases: print_colour_assignment
### Keywords: Printed_summary

### ** Examples

## No test: 
##Find the current working directory
wd = getwd()
##Set the working directory as the temporary one
setwd(tempdir())
##Load the data
data(OU_14)
t=unlist(OU_14["t"])
X=unlist(OU_14["X"])
Y=unlist(OU_14["Y"])

##Run the algorithm for multiple radius values
Radii=seq(0.2,1.0,0.1)
for (R in Radii){
  Alt_Alg("OU_14",t,X,Y,R,first='y',save='y')}

##Print a summary table of the results from the two criteria and the colour assigned
print_colour_assignment("OU_14",65,Radii,first='y')

##Reset the original working directory
setwd(wd)
## End(No test)



