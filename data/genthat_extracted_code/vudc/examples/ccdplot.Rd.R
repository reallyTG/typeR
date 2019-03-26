library(vudc)


### Name: ccdplot
### Title: Cumulative Characteristic Diagram
### Aliases: ccdplot
### Keywords: dplot

### ** Examples

# Create cumulative characteristic diagram using 100 random values 
# of standard normal distribution.
ccdplot(rnorm(100));

# Create cumulative characteristic diagram using 95 random values 
# of standard normal distribution and 5 outliers.
ccdplot(c(rnorm(95), 11:15)); 

# Neutralize the bias caused by the outliers, 
# removing the values greater than 10 in absolute.
ccdplot(c(rnorm(95), 11:15), remove.absolute=10);

# Neutralize the bias caused by the outliers, 
# removing the upper and lower 10%.
ccdplot(c(rnorm(95), 11:15), remove.ratio=0.1); 

# Create composite cumulative characteristic diagram of 4 arrays 
# (normal distribution, different element numbers, all the mean are 0, 
# the standard deviations are different).
ccdplot(list(rnorm(50, 0, 5), rnorm(100), rnorm(150), rnorm(200, 0, 0.2))) 

# Set some standard graphic parameters.
ccdplot(rnorm(100), main="Cumulative Characteristic Diagram", 
sub="100 random values of standard normal distribution", 
ylab="Summed random values", xlab="Sorted occurrences", col="red");



