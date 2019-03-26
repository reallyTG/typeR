library(lifecourse)


### Name: linkedLives
### Title: non-standardization test for lifecourses of linked lives
### Aliases: linkedLives
### Keywords: linked lives

### ** Examples

data(myHouseID)
data(mydata)
#------Exploring data---------
length(unique(myHouseID[,2])) 
# number of unique individuals represented = 64
length((myHouseID[,2]))
# number of individuals in dataset = 100
length(myHouseID[,2]) 
# number of individuals represented = 100
hist(myHouseID[1:10,2],col="blue")
# plotting the first 10 house ID's
# Frequencies greater than 1 indicate individuals
# with the same house ID.
#--------------

#----- Running Function------------------
#B = linkedLives(myHouseID[,2:14],c("non-mover","mover within gb"),mydata[,2:14])
# the first column of the myHouseID and mydata
# datasets contain personal ID's
#----------------------------------------

#---- Plotting----------------------------
#hist(B[[1]],col="red",xlab="Simulated test statistics"
#,ylab="Frequency",main="Results of non-standardization test",
#cex.lab=1.5,xlim=c(range(B[[1]])[1],B[[4]]))
#abline(v=B[[4]],lwd=3,col="orange")
#B[[2]]# pval (Left tailed)
#B[[3]]# pval (Right tailed)
#B[[4]]# Empirical test statistic
#----------------------------------



