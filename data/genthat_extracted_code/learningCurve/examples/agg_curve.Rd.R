library(learningCurve)


### Name: agg_curve
### Title: Aggregate Learning Curve
### Aliases: agg_curve

### ** Examples


## Not run: 
##D # A project is expected to get underway soon to produce 300
##D # widgets. Three departments will be involved. Historically,
##D # these departments have had learning curves of 85%, 87%, and
##D # 80% respectively. The first unit hours for these departments
##D # have been estimated at 70, 45, and 25 respectively. What is 
##D # the total predicted hours required for the entire effort?
##D 
##D t <- c(70, 45, 25)
##D r <- c(.85, .87, .8)
##D 
##D agg_curve(t = t, r = r, n = 300)
##D ## [1] 11000.96
## End(Not run)




