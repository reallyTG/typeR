library(dpcR)


### Name: plot.qdpcr
### Title: Plot 'qdpcr' objects
### Aliases: plot.qdpcr plot,qdpcr-method plot,qdpcr,ANY-method
### Keywords: hplot

### ** Examples


library(qpcR)
test <- cbind(reps[1L:45, ], reps2[1L:45, 2L:ncol(reps2)], reps3[1L:45, 
        2L:ncol(reps3)])
        
plot(qpcr2pp(data = test, cyc = 1, fluo = NULL, model = l5, delta = 5), rug = TRUE)




