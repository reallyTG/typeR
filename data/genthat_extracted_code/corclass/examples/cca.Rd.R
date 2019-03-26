library(corclass)


### Name: cca
### Title: Main function for CCA.
### Aliases: cca

### ** Examples

    data(cca.example)
    res1 <- cca(cca.example) # with igraph 0.7, this should find 3 classes of sizes 218 391 144.  
    plot(res1, 1) # plot them 
    plot(res1, 2)
    plot(res1, 3)

    print (round(res1$modules[[1]]$cormat, 2)) # examine the correlation matrix for the 1st module
    print (summary(res1$modules[[1]]$dtf)) # look at its variable ranges
    plot(res1, 1, bw = TRUE) # Plot it again in a more journal-friendly format.
    
    # now let's try setting the filter value too high
    res2 <- cca(cca.example, filter.value = 0.001) 
    # With igraph 0.7, the above now finds 17 classes 
    #    of sizes 216 1 1 371 1 1 1 1 1 1 1 1 11 141 1 1 2 
    # The small isolate classes can either be dropped manually, or by increasing filter.value 




