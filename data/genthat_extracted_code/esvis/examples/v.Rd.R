library(esvis)


### Name: v
### Title: Calculate the V effect size statistic
### Aliases: v

### ** Examples

free_reduced <- rnorm(800, 80, 20)
pay <- rnorm(500, 100, 10)
d <- data.frame(score = c(free_reduced, pay), 
				frl = c(rep("free_reduced", 800),  
						rep("pay", 500)))

v(score ~ frl, d)
# Compute V for all pairwise comparisons
v(reading ~ condition, star)

# Specify regular-sized classrooms as the reference group
v(reading ~ condition, 
		star, 
		ref_group = "reg")

# Return a vector instead of a data frame
v(reading ~ condition, 
		star, 
		ref_group = "reg", 
		tidy = FALSE)



