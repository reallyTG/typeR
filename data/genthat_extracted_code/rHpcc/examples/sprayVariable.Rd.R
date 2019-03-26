library(rHpcc)


### Name: sprayVariable
### Title: Used to upload the variable length file from the landing zone to
###   the cluster.
### Aliases: sprayVariable

### ** Examples

  query <- sprayVariable(ip="127.0.0.1", filePath="/var/lib/HPCCSystems/mydropzone/SampleFile.csv", 
              clusterName="mythor", logicalFileName="~ds::myFile")



