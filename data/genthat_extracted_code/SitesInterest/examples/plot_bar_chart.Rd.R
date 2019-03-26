library(SitesInterest)


### Name: plot_bar_chart
### Title: Plot the bar chart of residence times
### Aliases: plot_bar_chart
### Keywords: Plots

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

##Plot the bar chart of ranked non-overlapping residence times
plot_bar_chart("OU_14",0.3,first='y')

##It is possible to choose manually where the cut off between sites and none sites should be
plot_bar_chart("OU_14",0.3,first='y', number_sites=4)

##The colours can also be changed
plot_bar_chart("OU_14",0.3,first='y', colours = c("darkgreen","red"))

##Reset the original working directory
setwd(wd)
## End(No test)



