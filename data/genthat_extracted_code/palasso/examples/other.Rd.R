library(palasso)


### Name: other
### Title: Analysis functions for manuscript
### Aliases: other .prepare .simulate .predict .select
### Keywords: internal

### ** Examples

## No test: 
set.seed(1)
n <- 30; p <- 40
X <- matrix(rpois(n*p,lambda=3),nrow=n,ncol=p)
x <- palasso:::.prepare(X)
y <- palasso:::.simulate(x,effects=c(1,2))
predict <- palasso:::.predict(y,x)
select <- palasso:::.select(y,x,attributes(y))
## End(No test)



