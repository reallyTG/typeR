library(BoutrosLab.plotting.general)


### Name: ls.objects
### Title: List of objects
### Aliases: ls.objects
### Keywords: utilities

### ** Examples

set.seed(123456789);
temp <- data.frame(
	x = rnorm(100),
	y = sample(1:3, 100, TRUE)
	);

# returns up to 5 objects ordered by name 
ls.objects(n = 5);
# returns up to 10 (default) objects ordered by size
ls.objects(order.by = 'Size');



