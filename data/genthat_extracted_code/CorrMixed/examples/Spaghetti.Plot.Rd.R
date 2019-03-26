library(CorrMixed)


### Name: Spaghetti.Plot
### Title: Make a Spaghetti plot
### Aliases: Spaghetti.Plot
### Keywords: Exploratory analysis Individual profiles Mean structure

### ** Examples

# Open data
data(Example.Data)

# Plot individual profiles + mean
Spaghetti.Plot(Dataset = Example.Data, Outcome = Outcome, Id=Id, Time = Time)

# Plot individual profiles + median
Spaghetti.Plot(Dataset = Example.Data, Outcome = Outcome, Id=Id, Time = Time,
Add.Mean = FALSE, Add.Median = TRUE)



