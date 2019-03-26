library(heplots)


### Name: SocGrades
### Title: Grades in a Sociology Course
### Aliases: SocGrades
### Keywords: datasets

### ** Examples

data(SocGrades)
# basic MLM
grades.mod <- lm(cbind(midterm1, midterm2, final, eval) ~ 
	class + sex + gpa + boards + hssoc + pretest, data=SocGrades)
	
Anova(grades.mod, test="Roy")

clr <- c("red", "blue", "darkgreen", "magenta", "brown", "black", "darkgray")
heplot(grades.mod, col=clr)
pairs(grades.mod, col=clr)

## Not run: 
##D heplot3d(grades.mod, col=clr, wire=FALSE)
## End(Not run)

if (require(candisc)) {
	# calculate canonical results for all terms
	grades.can <- candiscList(grades.mod)
	# extract canonical R^2s
	unlist(lapply(grades.can, function(x) x$canrsq))
	# plot class effect in canonical space
	heplot(grades.can, term="class", scale=4)	

	# 1 df terms: show canonical scores and weights for responses
	plot(grades.can, term="sex")
	plot(grades.can, term="gpa")
	plot(grades.can, term="boards")
	}




