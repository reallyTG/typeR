library(hyper2)


### Name: maxp
### Title: Maximum likelihood estimation
### Aliases: maxp equalp allequal equalprobs

### ** Examples


data(chess)
maxp(chess)


data(rowing)

(x1 <- loglik(sculls2016,indep(maxp  (sculls2016))))
(x2 <- loglik(sculls2016,indep(equalp(sculls2016))))



## get a p-value for the null of equal player strengths:
pchisq(2*(x1-x2),df=size(sculls2016)-1,lower.tail=FALSE)

## Note that Wilks's theorem is only asymptotic.



