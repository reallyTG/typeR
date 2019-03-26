library(PRROC)


### Name: plot.PRROC
### Title: Plotting PRROC objects
### Aliases: plot.PRROC
### Keywords: hplot

### ** Examples

# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );

# compute PR curve
pr <- pr.curve( x, y, curve = TRUE );

# standard plot of PR curve
plot( pr );

# compute ROC curve
roc <- roc.curve( x, y, curve = TRUE );

# standard plot of ROC curve
plot( roc );

# create another set of scores
x.2 <- rnorm( 1000 );
y.2 <- rnorm( 1000, -2 );

# compute PR curve
pr.2 <- pr.curve( x.2, y.2, curve=TRUE );
# and ROC curve
roc.2 <- roc.curve( x.2, y.2, curve=TRUE );

# plot PR curve in red, without legend
plot( pr, color = "red", auc.main=FALSE );
# add second PR curve in green
plot( pr.2, color = 3, add = TRUE );


# plot ROC curve in red, without legend
plot( roc, color = "red", auc.main=FALSE);
# add second ROC curve in green
plot( roc.2, color = 3, add = TRUE );

# plot PR curve with legend below the main plot
plot( pr, legend=1 );

# compute PR curve with minimum and maximum curve, and random classifier
pr <- pr.curve( x, y, curve = TRUE, max.compute = TRUE, 
  min.compute = TRUE, rand.compute = TRUE);

# plot PR curve with area between minimum and 
# maximum curve in green and random classifier in blue
plot(pr, rand.plot = TRUE, fill.area = TRUE, fill.color = rgb(0.8,1,0.8), 
  maxminrand.col = "blue" );





