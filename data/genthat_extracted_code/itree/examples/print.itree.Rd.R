library(itree)


### Name: print.itree
### Title: Print an itree Object
### Aliases: print.itree
### Keywords: tree

### ** Examples

#rpart examples:
z.auto <- itree(Mileage ~ Weight, car.test.frame)
z.auto
## Not run: 
##D node), split, n, deviance, yval
##D       * denotes terminal node
##D 
##D  1) root 60 1354.58300 24.58333  
##D    2) Weight>=2567.5 45  361.20000 22.46667  
##D      4) Weight>=3087.5 22   61.31818 20.40909 *
##D      5) Weight<3087.5 23  117.65220 24.43478  
##D       10) Weight>=2747.5 15   60.40000 23.80000 *
##D       11) Weight<2747.5 8   39.87500 25.62500 *
##D    3) Weight<2567.5 15  186.93330 30.93333 *
## End(Not run)


