library(CIplot)


### Name: CIplot
### Title: Plot Confidential Interval
### Aliases: CIplot CIplot.default CIplot.htest CIplot.TukeyHSD CIplot.glht
###   CIplot.glm CIplot.ORci CIplot.posthocTGH
### Keywords: ORci TukeyHSD glht glm htest plot posthocTGH

### ** Examples

##### default (matrix or data.frame)
require(graphics)
x <- matrix(c(3, 1, 5,
              4, 2, 6), 2, 3, byrow = TRUE)
colnames(x) <- c("esti", "lwr", "upr")
rownames(x) <- c("A", "B")
CIplot(x, xlab = "difference", v = 2, las = 1)

##### 'htest' objects
require(graphics)

## t test
set.seed(1234)
a <- rnorm(10, 10, 2); b <- rnorm(10, 8, 2)
x <- t.test(a, b)
CIplot(x)

## binomial test
x <- binom.test(5, 20)
CIplot(x, xlim = c(0, 1))

## Fisher's exact test
x <- matrix(c(10, 7, 8, 9), 2, 2, byrow = TRUE)
res <- fisher.test(x)
CIplot(res, xlog = TRUE)


##### 'TukeyHSD' objects
require(graphics)

## Tukey test
aov1 <- aov(breaks ~ tension + wool, data = warpbreaks)
x <- TukeyHSD(aov1)

oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
CIplot(x, las = 1)
par(oldpar)

## example of line type and color
aov1 <- aov(breaks ~ tension, data = warpbreaks)
x <- TukeyHSD(aov1)
CIplot(x, las = 1,
       pcol = 2:4, pcolbg = 2:4, cicol = 2:4,
       vlty = 1, vcol = "gray")

##### 'glht' objects
require(graphics)

## Tukey test
require(multcomp)
aov1 <- aov(breaks ~ tension, data = warpbreaks)
x <- glht(aov1, linfct = mcp(tension = "Tukey"))
CIplot(x, las = 1)

## Dunnett test
x <- glht(aov1, linfct = mcp(tension = "Dunnett"))
CIplot(x, las = 1)


##### 'glm' object: logistic regression only!
## odds ratio
require(graphics)
require(MASS)
data(birthwt)
x <- glm(low ~  age + lwt + smoke + ptl + ht + ui, data = birthwt,
         family = binomial)
CIplot(x, las = 1)


##### 'posthocTGH' object
## Tukey or Games-Howell methos
require(graphics)
if (require(userfriendlyscience)) {
    x <- posthocTGH(warpbreaks$breaks, warpbreaks$tension)
    CIplot(x, las = 1)
}




