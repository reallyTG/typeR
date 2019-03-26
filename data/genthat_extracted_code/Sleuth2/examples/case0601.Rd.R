library(Sleuth2)


### Name: case0601
### Title: Discrimination Against the Handicapped
### Aliases: case0601
### Keywords: datasets

### ** Examples

str(case0601)
boxplot(Score~Handicap, data=case0601, ylab="Score")
aov.handicap <- aov(Score ~ Handicap, case0601)
summary(aov.handicap)
TukeyHSD(aov.handicap)

#Calculate confidence interval for linear combination
#(wheelchair+crutches)/2 - (amputee+hearing)/2 as in Display 6.4
mean.handicaps <- with(case0601, tapply(Score, Handicap, mean))
var.handicaps <- with(case0601, tapply(Score, Handicap, var))

n <- 14
s.pooled <- sqrt(sum((n-1)*var.handicaps)/sum((n-1)*5))

## either
cr.wh <- mean.handicaps["Wheelchair"] + mean.handicaps["Crutches"]
am.he <- mean.handicaps["Amputee"] + mean.handicaps["Hearing"]
g <- cr.wh/2 - am.he/2
## or
contr <- c(0, -1, 1, -1, 1)/2
g <- sum(contr * mean.handicaps)

se.g <- s.pooled * sqrt(sum(contr^2)/n)
t.65 <- qt(.975, 65)
## ci
g + c(-1,1) * t.65 * se.g



