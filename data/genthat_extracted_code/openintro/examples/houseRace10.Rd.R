library(openintro)


### Name: houseRace10
### Title: Election results for the 2010 U.S. House of Represenatives races
### Aliases: houseRace10
### Keywords: datasets

### ** Examples

data(houseRace10)
hr <- table(houseRace10[,c("abbr", "party1")])
nr <- apply(hr, 1, sum)

data(prRace08)
pr   <- prRace08[prRace08$state != "DC",c("state", "pObama")]
hr   <- hr[as.character(pr$state),]
(fit <- glm(hr ~ pr$pObama, family=binomial))

x1 <- pr$pObama[match(houseRace10$abbr, pr$state)]
y1 <- (houseRace10$party1 == "Democrat")+0
g  <- glm(y1 ~ x1, family=binomial)


x  <- pr$pObama[pr$state != "DC"]
nr <- apply(hr, 1, sum)
plot(x, hr[,"Democrat"] / nr,
    pch = 19, cex = sqrt(nr), col = "#22558844",
    xlim = c(20, 80), ylim = c(0, 1),
    xlab = "Percent vote for Obama in 2008",
    ylab = "Probability of Democrat winning House seat")
X  <- seq(0, 100, 0.1)
lo <- -5.6079 + 0.1009*X
p  <- exp(lo)/(1+exp(lo))
lines(X, p)
abline(h=0:1, lty=2, col="#888888")



