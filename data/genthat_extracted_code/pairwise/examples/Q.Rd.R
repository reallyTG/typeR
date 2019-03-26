library(pairwise)


### Name: Q
### Title: Person Fit Index Q
### Aliases: Q

### ** Examples

#######################
data(bfiN) # get some data
ip <- pair(daten = bfiN,m = 6) # item parameters according the partial credit model
Q(ip)

### with data an thresholds as external objects #####
threshold <- matrix(seq(-3,3,length.out = 9),ncol = 3)
dimnames(threshold) <- list(c("I1","I2","I3"),c("1","2","2"))
threshold
resp_vec <- c(3,0,2,1,2,2,2,2,1,3,0,NA,NA,0,2,3,NA,2,NA,2,1,2,NA,1,2,2,NA)
resp_emp <- matrix(resp_vec,ncol = 3,byrow = TRUE)
colnames(resp_emp) <- c("I1","I2","I3")
resp_emp
Qindex <- Q(data = resp_emp,threshold = threshold)
cbind(resp_emp,Qindex)

#### unequal number of thresholds ###################
threshold <- matrix(seq(-3,3,length.out = 9),ncol = 3)
dimnames(threshold) <- list(c("I1","I2","I3"),c("1","2","2"))
threshold[2,3] <- NA

resp_vec <- c(3,0,2,1,2,2,2,2,1,3,0,NA,NA,0,2,3,NA,2,NA,2,1,2,NA,1,2,2,NA)
resp_emp <- matrix(resp_vec,ncol = 3,byrow = TRUE)
colnames(resp_emp) <- c("I1","I2","I3")
resp_emp
Qindex <- Q(data = resp_emp,threshold = threshold)
cbind(resp_emp,Qindex)



