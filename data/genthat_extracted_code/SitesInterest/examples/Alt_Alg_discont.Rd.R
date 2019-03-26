library(SitesInterest)


### Name: Alt_Alg_discont
### Title: Application of Alt_Alg to discontinuous data
### Aliases: Alt_Alg_discont
### Keywords: Discontinuous

### ** Examples

##Find the current working directory
wd = getwd()
##Set the working directory as the temporary one
setwd(tempdir())
##Load the data
data(OU_14)
t=unlist(OU_14["t"])
X=unlist(OU_14["X"])
Y=unlist(OU_14["Y"])

##Number of path sections
n=5
##Number of recorded locations
N = length(t)

##A list of arrays of the time recoding for the 3 of the trajectory segments
t_all = list(t[seq(1,floor(N/n))], t[seq(floor(N/n)*2,floor(N/n)*3)], 
t[seq(floor(N/n)*4,floor(N/n)*5)])

##A list of arrays of the x-coordinates for the 3 of the trajectory segments
X_all = list(X[seq(1,floor(N/n))], X[seq(floor(N/n)*2,floor(N/n)*3)], 
X[seq(floor(N/n)*4,floor(N/n)*5)])

##A list of arrays of the y-coordinates for the 3 of the trajectory segments
Y_all = list(Y[seq(1,floor(N/n))], Y[seq(floor(N/n)*2,floor(N/n)*3)], 
Y[seq(floor(N/n)*4,floor(N/n)*5)])

##The calculation of the residence time for discontibuous data
Alt_Alg_discont("OU_14_discont",c("OU_14.1","OU_14.3","OU14.5"),t_all,X_all,Y_all,0.3,save='y')

##Reset the original working directory
setwd(wd)



