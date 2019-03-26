library(MEMSS)


### Name: Gasoline
### Title: Refinery yield of gasoline
### Aliases: Gasoline
### Keywords: datasets

### ** Examples

require(lattice)
str(Gasoline)
xyplot(yield ~ endpoint | Sample, Gasoline, aspect = 'xy',
       main = "Gasoline data", xlab = "Endpoint (degrees F)",
       ylab = "Percentage yield",
       type = c("g", "p", "r"),
       index.cond = function(x,y) coef(lm(y~x))[2],
       layout = c(5,2))
print(m1 <- lmer(yield ~ endpoint + (1|Sample), Gasoline), corr = FALSE)
m2 <- lmer(yield ~ endpoint + (endpoint|Sample), Gasoline, verbose = 1)
print(m2)
Gasoline$endptC <- with(Gasoline, endpoint - mean(endpoint))
m3 <- lmer(yield ~ endpoint + (endptC|Sample), Gasoline, verbose = 1)
print(m3)
xyplot(endptC ~ `(Intercept)`, ranef(m3)[[1]], type = c("g", "p", "r"),
       aspect = 1)



