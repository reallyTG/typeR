library(freqparcoord)


### Name: freqparcoord
### Title: Frequency-based parallel coordinates.
### Aliases: freqparcoord

### ** Examples

# baseball player data courtesy of UCLA Stat. Dept., www.socr.ucla.edu
data(mlb)

# plot baseball data, broken down by position category (infield,
# outfield, etc.); plot the 5 higest-density values in each group
freqparcoord(mlb,5,4:6,7,method="maxdens")
# we see that the most typical pitchers are tall and young, while the
# catchers are short and heavy

# same, but no grouping
freqparcoord(mlb,5,4:6,method="maxdens")

# find the outliers, 1 for each position 
freqparcoord(mlb,-1,4:6,7)
# for instance we see an infielder of average height and weight, but
# extremely high age, worth looking into

# do the same, but also plot and retain the indices of the rows being
# plotted, and the rows themselves
p <- freqparcoord(mlb,-1,4:6,7,keepidxs=4,plotidxs=TRUE)
p
p$idxs
p$xdisp
# ah, that outlier infielder was case number 674,
# Julio Franco, 48 years old!

# olive oil data courtesy of Dr. Martin Theus
data(oliveoils)
olv <- oliveoils

# there are 9 olive-oil producing areas of Italy, named Area here
# check whether the area groups have distinct patterns (yes)
freqparcoord(olv,1,3:10,1,k=15)

# same check but looking at within-group variation (turns out that some
# variables are more diverse in some areas than others)
freqparcoord(olv,25,3:10,1,k=15)
# yes, definitely, e.g. wide variation in stearic in Sicily

# look at it without stacking the groups
freqparcoord(olv,25,3:10,1,faceting="none",k=15)
# prettier this way, with some patterns just as discernible

## Not run: 
##D # programmers and engineers in Silicon Valley, 2000 census
##D data(prgeng)
##D pg <- prgeng
##D 
##D # compare men and women
##D freqparcoord(pg,10,dispcols=c(1,3,8),grpvar=7,faceting="horiz")
##D # men seem to fall into 2 subgroups, one with very low wages; let's get 
##D # a printout of the plotted points, grouped by gender
##D p <-
##D    freqparcoord(pg,10,dispcols=c(1,3,8),grpvar=7,faceting="horiz",keepidxs=7);
##D p$xdisp
##D # ah, there are some wages like $3000; delete those and look again;
##D pg1 <- pg[pg$wageinc >= 40000 & pg$wkswrkd >= 48,]
##D freqparcoord(pg1,50,dispcols=c(1,3,8),grpvar=7,faceting="horiz",keepidxs=7)
##D # the women seem to fall in 2 age groups, but not the men, worth further 
##D # analysis 
##D # note that all have the same education, a bachelor's degree, the 
##D # most frequent level
##D 
##D # generate some simulated data with clusters at (0,0), (1,2) and (3,3),
##D # and see whether "locmax" (clustering) picks them up
##D cv <- 0.5*diag(2)
##D x <- rmixmvnorm(10000,2,3,list(c(0,0),c(1,2),c(3,3)),list(cv,cv,cv))
##D p <- freqparcoord(x,m=1,method="locmax",keepidxs=1,k=50,klm=800)
##D p$xdisp  # worked well in this case, centers near (0,0), (1,2), (3,3)
##D 
##D # see how well outlier detection works
##D x <- rmixmvnorm(10000,2,3,list(c(0,0),c(1,2),c(8,8)),list(cv,cv,cv),
##D    wts=c(0.49,0.49,0.02))
##D # most of the outliers should be out toward (8,8)
##D p <- freqparcoord(x,m=-10,keepidxs=1)
##D p$xdisp
## End(Not run)




