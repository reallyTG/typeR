library(SitesInterest)


### Name: plot_radii_results
### Title: Plots the results from using different radii
### Aliases: plot_radii_results
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

##Run the algorithm for multiple radii values
Radii=seq(0.2,1.0,0.1)
for (R in Radii){
  Alt_Alg("OU_14",t,X,Y,R,first='y',save='y')}

##Plot the results (i.e. maximum percent drop and number of sites identified) from applying
##the algorithm with various radius values
plot_radii_results("OU_14",Radii,first='y')

##The location of the legend can be changed
plot_radii_results("OU_14",Radii,first='y', legend_loc="bottomleft")

##Reset the original working directory
setwd(wd)
## End(No test)



