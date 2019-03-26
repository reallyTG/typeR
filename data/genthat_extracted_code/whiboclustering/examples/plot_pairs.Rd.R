library(whiboclustering)


### Name: plot_pairs
### Title: Plot WhiBo Cluster Representatives
### Aliases: plot_pairs

### ** Examples

data <- iris[, 1:4] #Numerical data only

model <- whibo_clustering(data = data, k = 3)
plot_pairs(model) #Ploting Cluster Representatives only

plot_pairs(model, data) #Ploting Cluster Representatives and Data




