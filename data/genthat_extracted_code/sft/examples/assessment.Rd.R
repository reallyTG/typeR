library(sft)


### Name: assessment
### Title: Workload Assessment Functions
### Aliases: assessment
### Keywords: sft

### ** Examples

c1c.12 <- rexp(10000, .015)
c1i.12 <- rexp(10000, .01)
c1c    <- rexp(10000, .015)
c1i    <- rexp(10000, .01)

c2c.12 <- rexp(10000, .014)
c2i.12 <- rexp(10000, .01)
c2c    <- rexp(10000, .014)
c2i    <- rexp(10000, .01)

RT.1 <- pmin(c1c, c1i)
CR.1 <- c1c < c1i
RT.2 <- pmin(c2c, c2i)
CR.2 <- c2c < c2i

c1Correct <- c1c.12 < c1i.12
c2Correct <- c2c.12 < c2i.12

# OR Detection
CR.12 <- c1Correct | c2Correct
RT.12 <- rep(NA, 10000)
RT.12[c1Correct & c2Correct] <- pmin(c1c.12, c2c.12)[c1Correct & c2Correct]
RT.12[c1Correct & !c2Correct] <- c1c.12[c1Correct & !c2Correct]
RT.12[!c1Correct & c2Correct] <- c2c.12[!c1Correct & c2Correct]
RT.12[!c1Correct & !c2Correct] <- pmax(c1i.12, c2i.12)[!c1Correct & !c2Correct]

RT <- list(RT.12, RT.1, RT.2)
CR <- list(CR.12, CR.1, CR.2)
a.or.cf <- assessment(RT, CR, stopping.rule="OR", correct=TRUE, fast=TRUE, detection=TRUE)
a.or.cs <- assessment(RT, CR, stopping.rule="OR", correct=TRUE, fast=FALSE, detection=TRUE)
a.or.if <- assessment(RT, CR, stopping.rule="OR", correct=FALSE, fast=TRUE, detection=TRUE)
a.or.is <- assessment(RT, CR, stopping.rule="OR", correct=FALSE, fast=FALSE, detection=TRUE)

par(mfrow=c(2,2))
plot(a.or.cf, ylim=c(0,2))
plot(a.or.cs, ylim=c(0,2))
plot(a.or.if, ylim=c(0,2))
plot(a.or.is, ylim=c(0,2))


# AND 
CR.12 <- c1Correct & c2Correct
RT.12 <- rep(NA, 10000)
RT.12[CR.12] <- pmax(c1c.12, c2c.12)[CR.12]
RT.12[c1Correct & !c2Correct] <- c2i.12[c1Correct & !c2Correct]
RT.12[!c1Correct & c2Correct] <- c1i.12[!c1Correct & c2Correct]
RT.12[!c1Correct & !c2Correct] <- pmin(c1i.12, c2i.12)[!c1Correct & !c2Correct]

RT <- list(RT.12, RT.1, RT.2)
CR <- list(CR.12, CR.1, CR.2)
a.and.cf <- assessment(RT, CR, stopping.rule="AND", correct=TRUE, fast=TRUE, detection=TRUE)
a.and.cs <- assessment(RT, CR, stopping.rule="AND", correct=TRUE, fast=FALSE, detection=TRUE)
a.and.if <- assessment(RT, CR, stopping.rule="AND", correct=FALSE, fast=TRUE, detection=TRUE)
a.and.is <- assessment(RT, CR, stopping.rule="AND", correct=FALSE, fast=FALSE, detection=TRUE)

par(mfrow=c(2,2))
plot(a.and.cf, ylim=c(0,2))
plot(a.and.cs, ylim=c(0,2))
plot(a.and.if, ylim=c(0,2))
plot(a.and.is, ylim=c(0,2))



