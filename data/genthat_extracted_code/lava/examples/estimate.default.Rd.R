library(lava)


### Name: estimate.default
### Title: Estimation of functional of parameters
### Aliases: estimate.default estimate estimate.estimate merge.estimate

### ** Examples


## Simulation from logistic regression model
m <- lvm(y~x+z);
distribution(m,y~x) <- binomial.lvm("logit")
d <- sim(m,1000)
g <- glm(y~z+x,data=d,family=binomial())
g0 <- glm(y~1,data=d,family=binomial())

## LRT
estimate(g,g0)

## Plain estimates (robust standard errors)
estimate(g)

## Testing contrasts
estimate(g,null=0)
estimate(g,rbind(c(1,1,0),c(1,0,2)))
estimate(g,rbind(c(1,1,0),c(1,0,2)),null=c(1,2))
estimate(g,2:3) ## same as cbind(0,1,-1)
estimate(g,as.list(2:3)) ## same as rbind(c(0,1,0),c(0,0,1))
## Alternative syntax
estimate(g,"z","z"-"x",2*"z"-3*"x")
estimate(g,z,z-x,2*z-3*x)
estimate(g,"?")  ## Wilcards
estimate(g,"*Int*","z")
estimate(g,"1","2"-"3",null=c(0,1))
estimate(g,2,3)

## Usual (non-robust) confidence intervals
estimate(g,robust=FALSE)

## Transformations
estimate(g,function(p) p[1]+p[2])

## Multiple parameters
e <- estimate(g,function(p) c(p[1]+p[2],p[1]*p[2]))
e
vcov(e)

## Label new parameters
estimate(g,function(p) list("a1"=p[1]+p[2],"b1"=p[1]*p[2]))
##'
## Multiple group
m <- lvm(y~x)
m <- baptize(m)
d2 <- d1 <- sim(m,50)
e <- estimate(list(m,m),list(d1,d2))
estimate(e) ## Wrong
estimate(e,id=rep(seq(nrow(d1)),2))
estimate(lm(y~x,d1))

## Marginalize
f <- function(p,data)
  list(p0=lava:::expit(p["(Intercept)"] + p["z"]*data[,"z"]),
       p1=lava:::expit(p["(Intercept)"] + p["x"] + p["z"]*data[,"z"]))
e <- estimate(g, f, average=TRUE)
e
estimate(e,diff)
estimate(e,cbind(1,1))

## Clusters and subset (conditional marginal effects)
d$id <- rep(seq(nrow(d)/4),each=4)
estimate(g,function(p,data)
         list(p0=lava:::expit(p[1] + p["z"]*data[,"z"])),
         subset=d$z>0, id=d$id, average=TRUE)

## More examples with clusters:
m <- lvm(c(y1,y2,y3)~u+x)
d <- sim(m,10)
l1 <- glm(y1~x,data=d)
l2 <- glm(y2~x,data=d)
l3 <- glm(y3~x,data=d)

## Some random id-numbers
id1 <- c(1,1,4,1,3,1,2,3,4,5)
id2 <- c(1,2,3,4,5,6,7,8,1,1)
id3 <- seq(10)

## Un-stacked and stacked i.i.d. decomposition
iid(estimate(l1,id=id1,stack=FALSE))
iid(estimate(l1,id=id1))

## Combined i.i.d. decomposition
e1 <- estimate(l1,id=id1)
e2 <- estimate(l2,id=id2)
e3 <- estimate(l3,id=id3)
(a2 <- merge(e1,e2,e3))

## If all models were estimated on the same data we could use the
## syntax:
## Reduce(merge,estimate(list(l1,l2,l3)))

## Same:
iid(a1 <- merge(l1,l2,l3,id=list(id1,id2,id3)))

iid(merge(l1,l2,l3,id=TRUE)) # one-to-one (same clusters)
iid(merge(l1,l2,l3,id=FALSE)) # independence


## Monte Carlo approach, simple trend test example

m <- categorical(lvm(),~x,K=5)
regression(m,additive=TRUE) <- y~x
d <- simulate(m,100,seed=1,'y~x'=0.1)
l <- lm(y~-1+factor(x),data=d)

f <- function(x) coef(lm(x~seq_along(x)))[2]
null <- rep(mean(coef(l)),length(coef(l))) ## just need to make sure we simulate under H0: slope=0
estimate(l,f,R=1e2,null.sim=null)

estimate(l,f)



