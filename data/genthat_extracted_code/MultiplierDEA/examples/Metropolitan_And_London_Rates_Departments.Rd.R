library(MultiplierDEA)


### Name: Metropolitan_And_London_Rates_Departments
### Title: Data: Metropolitan and London rates departments data
### Aliases: Metropolitan_And_London_Rates_Departments
### Keywords: datasets

### ** Examples

data(Metropolitan_And_London_Rates_Departments)
attach(Metropolitan_And_London_Rates_Departments)

x <- data.frame(TotalCost)
rownames(x) <- Authority
colnames(x) <- colnames(Metropolitan_And_London_Rates_Departments)[2]


y <- data.frame(`Non-cnl`, Rate, Summons, NPV)
rownames(y) <- Authority
colnames(y) <- colnames(Metropolitan_And_London_Rates_Departments)[3:6]

detach(Metropolitan_And_London_Rates_Departments)

result <- DeaMultiplierModel(x,y,"crs", "input")



