library(opentraj)


### Name: ProcTraj
### Title: Process Trajectory
### Aliases: ProcTraj
### Keywords: Air Trajectory ~kwd2

### ** Examples

##---- For Windows system 


##---- For Unix alike systems 

# library("opentraj")
# library("doParallel")
# 
# ########################
# # SETUP VARIABLES
# kYear <- 2007
# KHeight <- 100
# 
# # path to meteorological files
# # you have to make sure this path is consistent 
# # for information on how to get HySplit Meteorological data,
# # http://www.arl.noaa.gov/documents/workshop/Spring2011/HYSPLIT_Tutorial.pdf
# KMetFiles <- "/path/to/the/meteorological/files/"
# 
# KOutFiles <- "/path/output/files/"
# 
# # HySplit instalation path
# KHySplitPath <- "/path/to/hysplit/"
# 
# # load the defoliation point file
# data(pheno2007)
# 
# # convert the dates to objects of class Date
# pheno2007$Year.Month.Day <-as.Date(pheno2007$Year.Month.Day)
# 
# # subset the data, in order to get only the points with ID = 1
# pointsDf<-split(pheno2007, pheno2007$ID)
# 
# # get the number of phisical cores availables
# cores <- detectCores()
# # 
# cl <- makeCluster(cores)
# 
# registerDoParallel(cl)
# 
# start.time<-Sys.time()
# 
# hy.traj2007 <- 
#   foreach(i = 1:length(pointsDf), .packages="opentraj", .combine = rbind) %dopar%
# {
#   points <- pointsDf[[i]]
#   
#   # get the point's latitude and longitude
#   lat<-points[[2]][1]
#   long<-points[[3]][1]
#   
#   dates <- points$Year.Month.Day
#   
#   ########################
#   output.file.name<-""
#   output.file.name<-paste("pheno", "_", as.character(i), "_", sep="")
#   
#   ProcTraj(lat = lat, lon = long, year = Year, name = output.file.name,
#            hour.interval = 1,
#            met = KMetFiles, out = KOutFiles, 
#            hours = 3, height = KHeight, hy.path = KHySplitPath, ID = i, dates=dates,
#            start.hour = "19:00", end.hour="23:00",
#            tz="EST", clean.files=F) 
# }
# 
# end.time<-Sys.time()
# time.taken<-end.time - start.time 
# time.taken
# 
# stopCluster(cl)



