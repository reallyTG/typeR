library(PRROC)


### Name: roc.curve
### Title: ROC curve
### Aliases: roc.curve
### Keywords: classif

### ** Examples

# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );
# compute area under ROC curve for the hard-labeled case
roc <- roc.curve( x, y );
print( roc );

# compute ROC curve and area under curve
roc <- roc.curve( x, y, curve = TRUE );
# plot curve
plot(roc);


# create artificial weights
x.weights <- runif( 1000 );
y.weights <- runif( 1000 );

# compute ROC curve and area under curve for weighted, hard-labeled data
roc <- roc.curve( x, y, x.weights, y.weights, curve = TRUE );
# and plot the curve
plot(roc);


# compute ROC curve and area under curve,
# and maximum, minimum, and random ROC curve for weighted, hard-labeled data
roc <- roc.curve(x, y, x.weights, y.weights, curve = TRUE, max.compute = TRUE, 
  min.compute = TRUE, rand.compute = TRUE);
# plot all three curves
plot(roc, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE)


# concatenate the drawn scores
scores<-c(x,y);
# and create artificial soft-labels
weights<-c(runif(1000, min = 0.5, max = 1), runif(1000, min = 0, max = 0.5))

# compute ROC curve and area under curve,
# and maximum, minimum, and random ROC curve  for soft-labeled data
roc<-roc.curve(scores.class0 = scores, weights.class0 = weights, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE);
# plot all three curves
plot(roc, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE)

# print the areas under the curves
print(roc);

# generate classification scores of a second classifier
scores.2<-c(rnorm( 1000 ),rnorm( 1000, -2 ));
# and compute the ROC curve
roc.2<-roc.curve(scores.class0 = scores.2, weights.class0 = weights, curve = TRUE)
# plot all three curves for the first classifier in red
plot(roc, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE, 
  color="red", auc.main=FALSE)
# and add the curve for the second classifier
plot(roc.2, add=TRUE, color="green")



