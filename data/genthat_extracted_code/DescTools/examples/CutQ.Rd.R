library(DescTools)


### Name: CutQ
### Title: Create a Factor Variable Using the Quantiles of a Continuous
###   Variable
### Aliases: CutQ
### Keywords: manip univar

### ** Examples

# create example data
## Don't show: 
set.seed(1234)
## End(Don't show)
x <- rnorm(1000)

# cut into quartiles
quartiles <- CutQ(x)
table(quartiles)

# cut into deciles
deciles <- CutQ(x, seq(0, 1, by=0.1), labels=NULL)
table(deciles)

# show handling of 'tied' quantiles.
x <- round(x)  # discretize to create ties
stem(x)        # display the ties
deciles <- CutQ( x, seq(0, 1, by=0.1) )

table(deciles) # note that there are only 5 groups (not 10) 
               # due to duplicates



