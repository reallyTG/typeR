library(MultiplierDEA)


### Name: Departments_Of_Accounting
### Title: Data: UK University Departments Of Accounting Efficiency data.
### Aliases: Departments_Of_Accounting
### Keywords: datasets

### ** Examples

data(Departments_Of_Accounting)
attach(Departments_Of_Accounting)

x <- data.frame(AcademicStaff)
rownames(x) <- Departments
colnames(x) <- colnames(Departments_Of_Accounting)[9]

y <- data.frame(Undergraduates, Research, Taught,(Res.Co + OtherRes + OtherIncome))
rownames(y) <- Departments
colnames(y)[1] <- colnames(Departments_Of_Accounting)[2]
colnames(y)[2] <- colnames(Departments_Of_Accounting)[3]
colnames(y)[3] <- colnames(Departments_Of_Accounting)[4]
colnames(y)[4] <- c("Total_Income")

detach(Departments_Of_Accounting)

result <- DeaMultiplierModel(x,y,"crs", "input")




