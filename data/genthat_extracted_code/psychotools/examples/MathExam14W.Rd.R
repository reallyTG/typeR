library(psychotools)


### Name: MathExam14W
### Title: Mathematics 101 Exam Results
### Aliases: MathExam14W
### Keywords: datasets

### ** Examples

## load data and exclude extreme scorers
data("MathExam14W", package = "psychotools")
MathExam14W <- transform(MathExam14W,
  points = 2 * nsolved - 0.5 * rowSums(credits == 1)
)
me <- subset(MathExam14W, nsolved > 0 & nsolved < 13)


## item response data:
## solved (correct/other) or credits (correct/incorrect/not attempted)
par(mfrow = c(1, 2))
plot(me$solved)
plot(me$credits)

## PCA
pr <- prcomp(me$solved, scale = TRUE)
names(pr$sdev) <- 1:10
plot(pr, main = "", xlab = "Number of components")
biplot(pr, col = c("transparent", "black"), main = "",
  xlim = c(-0.065, 0.005), ylim = c(-0.04, 0.065))


## points achieved (and 50% threshold)
par(mfrow = c(1, 1))
hist(MathExam14W$points, breaks = -4:13 * 2 + 0.5,
  col = "lightgray", main = "", xlab = "Points")
abline(v = 12.5, lwd = 2, col = 2)


## Rasch and partial credit model
ram <- raschmodel(me$solved)
pcm <- pcmodel(me$credits)

## various types of graphics displays
plot(ram, type = "profile")
plot(pcm, type = "profile", add = TRUE, col = "blue")
plot(ram, type = "piplot")
plot(pcm, type = "piplot")
plot(ram, type = "region")
plot(pcm, type = "region")
plot(ram, type = "curves")
plot(pcm, type = "curves")


## No test: 
## test for differential item function with automatic anchoring
## passing vs. not passing students
at1 <- anchortest(solved ~ factor(nsolved <= 7), data = me,
  adjust = "single-step")
at1
plot(at1$final_tests)
## -> "good" students discriminate somewhat more
## (quad/payflow/lagrange are slightly more difficult)

## group 1 vs. group 2
at2 <- anchortest(solved ~ group, data = me, adjust = "single-step")
at2
plot(at2$final_tests)
## -> quad/payflow/planning easier for group 1
## -> hesse slightly easier for group 2

## bring out differences between groups 1 and 2
## by (anchored) item difficulty profiles
ram1 <- raschmodel(subset(me, group == "1")$solved)
ram2 <- raschmodel(subset(me, group == "2")$solved)
plot(ram1, parg = list(ref = at2$anchor_items), ylim = c(-2, 3))
plot(ram2, parg = list(ref = at2$anchor_items), add = TRUE, col = "blue")
legend("topleft", c("Group 1", "Group 2"), pch = 21,
  pt.bg = c("lightgray", "blue"), bty = "n")
## End(No test)



