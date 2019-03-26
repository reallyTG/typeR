library(esvis)


### Name: auc
### Title: Calculate the area under the curve
### Aliases: auc

### ** Examples

free_reduced <- rnorm(800, 80, 20)
pay <- rnorm(500, 100, 10)
d <- data.frame(score = c(free_reduced, pay), 
				frl = c(rep("free_reduced", 800),  
						rep("pay", 500)))

auc(score ~ frl, d)
# Compute AUC for all pairwise comparisons
auc(reading ~ condition, star)

# Specify regular-sized classrooms as the reference group
auc(reading ~ condition, 
		star, 
		ref_group = "reg")

# Return a vector instead of a data frame
auc(reading ~ condition, 
		star, 
		ref_group = "reg", 
		tidy = FALSE)



