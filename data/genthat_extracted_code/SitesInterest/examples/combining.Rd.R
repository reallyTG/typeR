library(SitesInterest)


### Name: combining
### Title: Combines the residence times for the same set of circles and
###   different trajectories
### Aliases: combining
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
#Number of recorded locations
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

##The names of each path segment
Names = c("OU_14.1","OU_14.3","OU_14.5")

##Calculates the residence time for each path segment individually
Alt_Alg("OU_14.1",unlist(t_all[1]),unlist(X_all[1]),unlist(Y_all[1]),0.3,first='y',save='y')
Alt_Alg("OU_14.3",unlist(t_all[2]),unlist(X_all[2]),unlist(Y_all[2]),0.3,first='y',save='y')
Alt_Alg("OU_14.5",unlist(t_all[3]),unlist(X_all[3]),unlist(Y_all[3]),0.3,first='y',save='y')

Circle_names = Names
Path_names = Names

##Calculate the residence time for each set of circles and each path segment
for (Circles_name in Circle_names){
  df = read.csv(paste(Circles_name,"_UD_alt_R",0.3,".csv",sep=''))
  t_centers_list = df[1]
  X_centers_list = df[2]
  Y_centers_list = df[3]
  t_centers = unlist(t_centers_list)
  X_centers = unlist(X_centers_list)
  Y_centers = unlist(Y_centers_list)
  for (Path_name in Path_names){
  if (Circles_name != Path_name){
       index = match(Path_name,Names)
       Alt_Alg_mini(Circles_name, t_centers, X_centers, Y_centers, Path_name, 
       unlist(t_all[index]),unlist(X_all[index]),unlist(Y_all[index]),0.3,s=10,m=500,save='y')}}}

##Combine all the residence times for the same circles
combining("OU_14_discont", Circle_names, Path_names, 0.3,save='y')

##Reset the original working directory
setwd(wd)



