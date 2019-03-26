library(ellipse)


### Name: ellipse.glm
### Title: Outline an approximate pairwise confidence region
### Aliases: ellipse.glm
### Keywords: dplot regression

### ** Examples
     
## Dobson (1990) Page 93: Randomized Controlled Trial :

     counts <- c(18,17,15,20,10,20,25,13,12)
     outcome <- gl(3,1,9)
     treatment <- gl(3,3)
     glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())

# Plot an approximate 95 % confidence region for the two Outcome parameters

	plot(ellipse(glm.D93, which = c(2,3)), type = 'l')
	points(glm.D93$coefficients[2], glm.D93$coefficients[3])



