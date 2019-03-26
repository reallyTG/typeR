library(PSGExpress)


### Name: rpsg_getfunctionsensetivity
### Title: PSG Functions sensetivity calculation
### Aliases: rpsg_getfunctionsensetivity

### ** Examples


#Create Matrix
matrix_scenarios <- matrix(c(1,4,8,3, 7,-5,4,-6, -2,8,-1,0,0,-3,-4,9),nrow=4, byrow=TRUE)
colnames(matrix_scenarios) <- colnames(matrix_scenarios,do.NULL = FALSE, prefix = "x")
scenario_benchmark <- c(-2, 11, 6, 10)
scenario_probability <- c(0.2, 0.2, 0.3, 0.3)
matrix_scenarios <- cbind(matrix_scenarios,scenario_benchmark,scenario_probability)

#Create Point
point_a <- c(1,1,1,1)
names(point_a) <-c("x1","x2","x3","x4")

val1<- rpsg_getfunctionsensetivity("cvar_risk(0.65,matrix_scenarios)",point_a)

print(val1)






