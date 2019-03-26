library(palasso)


### Name: palasso
### Title: Paired lasso
### Aliases: palasso palasso-package

### ** Examples

set.seed(1)
n <- 50; p <- 20
y <- rbinom(n=n,size=1,prob=0.5)
X <- lapply(1:2,function(x) matrix(rnorm(n*p),nrow=n,ncol=p))
object <- palasso(y=y,X=X,family="binomial")




