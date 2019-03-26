library(antitrust)


### Name: Cournot
### Title: Multi-product Cournot/Stackelberg Calibration and Merger
###   Simulation With Linear or Log-Linear Demand
### Aliases: cournot Cournot stackelberg Stackelberg

### ** Examples


## Simulate a Cournot merger between two single-plant firms 
## producing a single product in a
## 5-firm market with linear demand and quadratic costs 



n <- 5 #number of firms in market pre-merger
cap <- rnorm(n,mean = .5, sd = .1)
int <- 10
slope <- -.25 

B.pre.c = matrix(slope,nrow=n,ncol=n)
diag(B.pre.c) = 2* diag(B.pre.c) - 1/cap
quantity.pre.c = rowSums(solve(B.pre.c) * -int) 
price.pre.c = int + slope * sum(quantity.pre.c)
mc.pre.c = quantity.pre.c/cap
vc.pre.c = quantity.pre.c^2/(2*cap)
margin.pre.c = 1 - mc.pre.c/price.pre.c
ps.pre.c = price.pre.c*quantity.pre.c - vc.pre.c

mktQuant.pre.c = sum(quantity.pre.c)

## suppose firm 1 acquires firm 2
## This model has a closed form solution 
B.post.c = B.pre.c
B.post.c[1,2] = 2*B.post.c[1,2] 
B.post.c[2,1] = 2*B.post.c[2,1]

quantity.post.c = rowSums(solve(B.post.c) * -int) 
price.post.c = int + slope * sum(quantity.post.c)
mc.post.c = quantity.post.c/cap
vc.post.c = quantity.post.c^2/(2*cap)
margin.post.c = 1 - mc.post.c/price.post.c
ps.post.c = price.post.c*quantity.post.c - vc.post.c

mktQuant.post.c = sum(quantity.post.c, na.rm=TRUE)

#check if merger is profitable for merging parties
isprofitable.c = ps.post.c - ps.pre.c
isprofitable.c= sum(isprofitable.c[1:2]) > 0 


#prep inputs for Cournot
owner.pre <- diag(n)
owner.post <- owner.pre
owner.post[1,2] <- owner.post[2,1] <- 1



result.c <- cournot(prices = price.pre.c,quantities = as.matrix(quantity.pre.c),
                    margins=as.matrix(margin.pre.c),
                    ownerPre=owner.pre,ownerPost=owner.post)

print(result.c)           # return predicted price change
summary(result.c)         # summarize merger simulation

## check if 'cournot' yields the same result as closed-form solution
#print(all.equal(sum(result.c@quantityPre) , mktQuant.pre.c))
#print(all.equal(sum(result.c@quantityPost) , mktQuant.post.c))




## Simulate a Stackelberg merger between two single-plant firms 
## producing a single product in a
## 5-firm market with linear demand and quadratic costs.
## Allow both merging parties to be followers pre-merger,
## but assume that they become leaders post-merger.
## Finally, assume that pre-merger, there is a single leader who ## remains a leader post-merger
## Note: This example uses setup from the above Cournot example

isLeader.pre = matrix(rep(FALSE,n), ncol=1)
isLeader.pre[n,] = TRUE
isLeader.post = isLeader.pre
isLeader.post[1:2,] = TRUE

passthru.pre = matrix(-slope^2/(2*slope - 1/cap))
passthru.post = passthru.pre
passthru.pre[isLeader.pre] = 0
passthru.post[isLeader.post] = 0

B.pre.s = matrix(slope,nrow=n,ncol=n)
diag(B.pre.s) = 2* diag(B.pre.s) - 1/cap
diag(B.pre.s)[n] = diag(B.pre.s)[n] + sum(passthru.pre)

quantity.pre.s = rowSums(solve(B.pre.s) * ( -int)) 
price.pre.s = int + slope * sum(quantity.pre.s)
mc.pre.s = quantity.pre.s/cap
vc.pre.s = quantity.pre.s^2/(2*cap)
margin.pre.s = 1 - mc.pre.s/price.pre.s
ps.pre.s = price.pre.s*quantity.pre.s - vc.pre.s

mktQuant.pre.s = sum(quantity.pre.s)

## suppose firm 1 acquires firm 2
## This model has a closed form solution 
B.post.s = matrix(slope,nrow=n,ncol=n)
diag(B.post.s) = 2* diag(B.post.s) - 1/cap
B.post.s[1,2] = 2*B.post.s[1,2] 
B.post.s[1,1:2] = B.post.s[1,1:2]  + sum(passthru.post)
B.post.s[2,1] = 2*B.post.s[2,1]
B.post.s[2,1:2] = B.post.s[2,1:2]  + sum(passthru.post)
diag(B.post.s)[n] = diag(B.post.s)[n]  +  sum(passthru.post)

quantity.post.s = rowSums(solve(B.post.s) * as.vector( -int ) )
price.post.s = int + slope * sum(quantity.post.s)
mc.post.s = quantity.post.s/cap
vc.post.s = quantity.post.s^2/(2*cap)
margin.post.s = 1 - mc.post.s/price.post.s
ps.post.s = price.post.s*quantity.post.s - vc.post.s

mktQuant.post.s = sum(quantity.post.s, na.rm=TRUE)

#check if merger is profitable for merging parties
isprofitable.s = ps.post.s - ps.pre.s
isprofitable.s = sum(isprofitable.s[1:2]) > 0 


#prep inputs for Stackelberg
owner.pre <- diag(n)
owner.post <- owner.pre
owner.post[1,2] <- owner.post[2,1] <- 1



result.s <- stackelberg(prices = price.pre.s,quantities = as.matrix(quantity.pre.s),
                        margins=as.matrix(margin.pre.s),ownerPre=owner.pre,
                        ownerPost=owner.post, 
                        isLeaderPre = isLeader.pre, isLeaderPost = isLeader.post)

print(result.s)           # return predicted price change
summary(result.s)         # summarize merger simulation

## check if 'stackelberg' yields the same result as closed-form solution
#print(all.equal(sum(result.s@quantityPre) , mktQuant.pre.s))
#print(all.equal(sum(result.s@quantityPost) , mktQuant.post.s))








