library(heplots)


### Name: FootHead
### Title: Head measurements of football players
### Aliases: FootHead
### Keywords: datasets

### ** Examples

data(FootHead)
str(FootHead)
require(car)

# use Helmert contrasts for group
contrasts(FootHead$group) <- contr.helmert
contrasts(FootHead$group)

foot.mod <- lm(cbind(width, circum,front.back,eye.top,ear.top,jaw)~group, data=FootHead)
Manova(foot.mod)

# show the HE plot for the first two variables
heplot(foot.mod, main="HE plot for width and circumference", fill=TRUE,
	col=c("red", "blue"))

# show it with tests of Helmert contrasts
heplot(foot.mod, hypotheses=list("group.1"="group1","group.2"="group2"),
	col=c("red", "blue", "green3", "green3" ),
	main="HE plot with orthogonal Helmert contrasts")

# show all pairwise HE plots
pairs(foot.mod)

# ... with tests of Helmert contrasts
pairs(foot.mod, hypotheses=list("group.1"="group1","group.2"="group2"),
	col=c("red", "blue", "green3", "green3"), hyp.labels=FALSE)

# see that the hypothesis for groups really is 2D
heplot3d(foot.mod, variables=c(1,2,6),
	hypotheses=list("group.1"="group1","group.2"="group2"),
	col=c("red", "blue", "green3", "green3" ), wire=FALSE)




