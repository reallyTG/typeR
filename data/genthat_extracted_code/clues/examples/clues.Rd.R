library(clues)


### Name: clues
### Title: Clustering Method Based on Local Shrinking
### Aliases: clues
### Keywords: cluster

### ** Examples

    # Maronna data set
    data(Maronna)
    # data matrix
    maronna <- Maronna$maronna

    # partition by clues
    res <- clues(maronna, quiet = TRUE)

    # get summary statistics
    summary(res)

    # scatter plots and plot of trajectories
    ## Not run: plot(res)



