library(PRROC)


### Name: pr.curve
### Title: PR curve
### Aliases: pr.curve
### Keywords: classif

### ** Examples

# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );
# compute area under PR curve for the hard-labeled case
pr <- pr.curve( x, y );
print( pr );

# compute PR curve and area under curve
pr <- pr.curve( x, y, curve = TRUE );
# plot curve
plot(pr);

# create artificial weights
x.weights <- runif( 1000 );
y.weights <- runif( 1000 );

# compute PR curve and area under curve for weighted, hard-labeled data
pr <- pr.curve( x, y, x.weights, y.weights, curve = TRUE );
# and plot the curve
plot(pr);


# compute PR curve and area under curve,
# and maximum, minimum, and random PR curve for weighted, hard-labeled data
pr <- pr.curve(x, y, x.weights, y.weights, curve = TRUE, max.compute = TRUE, 
  min.compute = TRUE, rand.compute = TRUE);
# plot all three curves
plot(pr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE)


# concatenate the drawn scores
scores<-c(x,y);
# and create artificial soft-labels
weights<-c(runif(1000, min = 0.5, max = 1), runif(1000, min = 0, max = 0.5))

# compute PR curve and area under curve,
# and maximum, minimum, and random PR curve for soft-labeled data
pr<-pr.curve(scores.class0 = scores, weights.class0 = weights, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE);
# plot all three curves
plot(pr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE)

# print the areas under the curves
print(pr);


# generate classification scores of a second classifier
scores.2<-c(rnorm( 1000 ),rnorm( 1000, -2 ));
# and compute the PR curve
pr.2<-pr.curve(scores.class0 = scores.2, weights.class0 = weights, curve = TRUE)
# plot all three curves for the first classifier in red
plot(pr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE, 
  color="red", auc.main=FALSE)
# and add the curve for the second classifier
plot(pr.2, add=TRUE, color="green")



