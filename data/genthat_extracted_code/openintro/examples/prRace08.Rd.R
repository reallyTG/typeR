library(openintro)


### Name: prRace08
### Title: Election results for the 2008 U.S. Presidential race
### Aliases: prRace08
### Keywords: datasets election 2008 president United States

### ** Examples

#===> Obtain 2010 US House Election Data <===#
data(houseRace10)
hr <- table(houseRace10[,c("abbr", "party1")])
nr <- apply(hr, 1, sum)

#===> Obtain 2008 President Election Data <===#
data(prRace08)
pr   <- prRace08[prRace08$state != "DC",c("state", "pObama")]
hr   <- hr[as.character(pr$state),]
(fit <- glm(hr ~ pr$pObama, family=binomial))

#===> Visualizing Binomial outcomes <===#
x  <- pr$pObama[pr$state != "DC"]
nr <- apply(hr, 1, sum)
plot(x, hr[,"Democrat"]/nr, pch=19, cex=sqrt(nr), col="#22558844",
    xlim=c(20, 80), ylim=c(0, 1), xlab="Percent vote for Obama in 2008",
    ylab="Probability of Democrat winning House seat")

#===> Logistic Regression <===#
x1 <- pr$pObama[match(houseRace10$abbr, pr$state)]
y1 <- (houseRace10$party1 == "Democrat")+0
g  <- glm(y1 ~ x1, family=binomial)
X  <- seq(0, 100, 0.1)
lo <- -5.6079 + 0.1009*X
p  <- exp(lo)/(1+exp(lo))
lines(X, p)
abline(h=0:1, lty=2, col="#888888")



