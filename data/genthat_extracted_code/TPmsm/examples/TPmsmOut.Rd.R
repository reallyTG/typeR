library(TPmsm)


### Name: TPmsmOut
### Title: Convert a data.frame in the 'TPmsm' format to other formats
### Aliases: TPmsmOut
### Keywords: manip survival

### ** Examples

data(heartTP)
heartP3 <- TPmsmOut( heartTP, c("time1", "event1", "Stime", "event") )
head(heartP3)



