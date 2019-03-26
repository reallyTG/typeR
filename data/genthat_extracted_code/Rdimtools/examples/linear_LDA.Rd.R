library(Rdimtools)


### Name: do.lda
### Title: Linear Discriminant Analysis
### Aliases: do.lda

### ** Examples

## Not run: 
##D ## generate data of 3 types with clear difference
##D dt1  = aux.gensamples(n=33)-100
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+100
##D 
##D ## merge the data and create a label correspondingly
##D Y      = rbind(dt1,dt2,dt3)
##D label  = c(rep(1,33), rep(2,33), rep(3,33))
##D 
##D ## perform onto 2-dimensional space
##D output = do.lda(Y, label, ndim=2)
##D 
##D ## visualize
##D plot(output$Y[,1], output$Y[,2], main="3 groups on 2d plane")
## End(Not run)




