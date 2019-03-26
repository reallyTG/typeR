library(enaR)


### Name: environCentrality
### Title: Environ Centrality an Ecological Network
### Aliases: environCentrality

### ** Examples




data(troModels)
F <- enaFlow(troModels[[6]])
ec <- environCentrality(F$N)
attributes(ec)
barplot(sort(ec$AEC, decreasing = TRUE), col = 4, ylab = "Average Environ Centrality", 
    ylim = c(0, 0.4))






