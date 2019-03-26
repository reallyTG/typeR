library(cNORM)


### Name: plotBoxCox
### Title: Plot regression model versus box cox for a specific age
### Aliases: plotBoxCox

### ** Examples


# Calculate model based on PPVT4 data
data <- prepareData(ppvt)
model <- bestModel(data)

# compute power function for a specific age, e. g. 9.2
bc <- boxcox(model, 9.2)

# plot results as a function of norm scores
plotBoxCox(model, bc, minRaw=0, maxRaw=228, type=1)

# plot density
plotBoxCox(model, bc, minRaw=0, maxRaw=228, type=2)



