library(MultiplierDEA)


### Name: Evaluation_Educational_Program
### Title: Data: Educational program data
### Aliases: Evaluation_Educational_Program
### Keywords: datasets

### ** Examples

data(Evaluation_Educational_Program)
attach(Evaluation_Educational_Program)


x <- data.frame(Contact_Hours, Number_of_FTE_Staff, Facility_Allocation, Expenditures)
rownames(x) <- Program
colnames(x) <- colnames(Evaluation_Educational_Program)[6:9]


y <- data.frame(Revenue_Generated, Student_Employed, Employer_Satisfaction)
rownames(y) <- Program
colnames(y) <- colnames(Evaluation_Educational_Program)[3:5]

detach(Evaluation_Educational_Program)

result <- DeaMultiplierModel(x,y,"crs", "input")



