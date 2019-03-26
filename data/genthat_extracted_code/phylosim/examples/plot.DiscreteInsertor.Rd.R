library(phylosim)


### Name: plot.DiscreteInsertor
### Title: Plot the insertion length distribution
### Aliases: plot.DiscreteInsertor DiscreteInsertor.plot
###   plot,DiscreteInsertor-method

### ** Examples

       i<-DiscreteInsertor(
               name="MyDiscIns",
               sizes=1:6,
               probs=c(0.25000000, 0.16666667, 0.08333333, 0.08333333, 0.16666667, 0.25000000)
       )
       # plot the insertion length distribution
       plot(i)
 


