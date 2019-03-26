library(SitesInterest)


### Name: Alt_Alg_mini
### Title: Calculates the residence times for circles taken from one
###   trajectory, but applied to another
### Aliases: Alt_Alg_mini
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

##A list of arrays of the time recoding for the 3 of the path segments
t_all = list(t[seq(1,floor(N/n))], t[seq(floor(N/n)*2,floor(N/n)*3)], 
t[seq(floor(N/n)*4,floor(N/n)*5)])

##A list of arrays of the x-coordinates for the 3 of the path segments
X_all = list(X[seq(1,floor(N/n))], X[seq(floor(N/n)*2,floor(N/n)*3)], 
X[seq(floor(N/n)*4,floor(N/n)*5)])

##A list of arrays of the y-coordinates for the 3 of the path segments
Y_all = list(Y[seq(1,floor(N/n))], Y[seq(floor(N/n)*2,floor(N/n)*3)], 
Y[seq(floor(N/n)*4,floor(N/n)*5)])

##Calculates the residence time for one particular path segment
Alt_Alg("OU_14.1",unlist(t_all[1]),unlist(X_all[1]),unlist(Y_all[1]),0.3,first='y',save='y')

##Load the data of the circles found from Alt_Alg
df = read.csv(paste("OU_14.1","_UD_alt_R",0.3,".csv",sep=''))
t_centers = unlist(df[1])
X_centers = unlist(df[2])
Y_centers = unlist(df[3])

##Calculates the residence time from path segment 3, using circles from path segment 1
Alt_Alg_mini("OU14.1", t_centers, X_centers, Y_centers, "OU_14.3", unlist(t_all[2]), 
unlist(X_all[2]), unlist(Y_all[2]), 0.3,save='y')

##Reset the original working directory
setwd(wd)



