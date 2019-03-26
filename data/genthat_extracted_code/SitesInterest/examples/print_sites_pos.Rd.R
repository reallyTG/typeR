library(SitesInterest)


### Name: print_sites_pos
### Title: Prints the positions of the identified sites
### Aliases: print_sites_pos print.sites_pos
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

##Calculate the residence time with a radius of 0.3 and not including the first circle
Alt_Alg("OU_14",t,X,Y,0.3,first='y',save='y')

##Print the coordinates of the centres of all identified sites
print_sites_pos("OU_14",0.3,first='y')

##There is also the option of saving the results as a csv file
print_sites_pos("OU_14",0.3,first='y')

##Reset the original working directory
setwd(wd)
## End(No test)



