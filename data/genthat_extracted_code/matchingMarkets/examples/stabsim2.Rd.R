library(matchingMarkets)


### Name: stabsim2
### Title: Simulated data for college admissions problem
### Aliases: stabsim2
### Keywords: generate

### ** Examples


## Simulate two-sided matching data for 2 markets (m=2) with 10 students
## (nStudents=10) per market and 3 colleges (nColleges=3) with quotas of
## 2, 3, and 5 students, respectively.

xdata <- stabsim2(m=2, nStudents=10, nSlots=c(2,3,5), verbose=FALSE,
  colleges = "c1", students = "s1",
  outcome = ~ c1:s1 + eta + nu,
  selection = ~ -1 + c1:s1 + eta
)
head(xdata$OUT)
head(xdata$SEL)




