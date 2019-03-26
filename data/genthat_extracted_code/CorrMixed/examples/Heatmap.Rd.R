library(CorrMixed)


### Name: Heatmap
### Title: Plot a heatmap of the correlation structure
### Aliases: Heatmap
### Keywords: Exploratory analysis Within-subject correlation Heatmap Plot
###   Reliability

### ** Examples

# Open data
data(Example.Data)

# Make heatmap
Heatmap(Dataset=Example.Data, Id = "Id", 
Outcome="Outcome", Time = "Time")

# Make heatmap in black and white
Heatmap(Dataset=Example.Data, Id = "Id", 
Outcome="Outcome", Time = "Time", colors=FALSE)



