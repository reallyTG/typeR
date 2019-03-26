library(RTDE)


### Name: qqparetoplot
### Title: The QQ Pareto plot
### Aliases: qqparetoplot
### Keywords: distribution

### ** Examples


#####
# (1) small examples

set.seed(1234)
x <- rupareto(100)
qqparetoplot(x)

x <- rexp(100)
qqparetoplot(x)

		



