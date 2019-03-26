library(SitesInterest)


### Name: print_site_visits
### Title: Prints the site visitation results
### Aliases: print_site_visits
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

##Prints a summary of the site visitation results
print_site_visits("OU_14",X,Y,0.3,first='y')

##There is also the option of saving the results as a csv file
print_site_visits("OU_14",X,Y,0.3,first='y',save='y')

##Reset the original working directory
setwd(wd)
## End(No test)



