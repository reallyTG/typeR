library(compareGroups)


### Name: printTable
### Title: 'Nice' table format.
### Aliases: printTable
### Keywords: utilities

### ** Examples


require(compareGroups)

data(regicor)

# example of the coefficients table from a linear regression
model <- lm(chol ~ age + sex + bmi, regicor)
results <- coef(summary(model))
results <- cbind(Var = rownames(results), round(results, 4))
printTable(results)

# or visualize the first rows of the iris data frame. 
# In this example, the first column is not treated as a row.names column and it is right justified.
printTable(head(iris), FALSE)

# the same example with columns centered
printTable(head(iris), FALSE, 'centre')





