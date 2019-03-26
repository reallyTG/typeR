library(gap)


### Name: metap
### Title: Meta-analysis of p values
### Aliases: metap
### Keywords: htest

### ** Examples

## Not run: 
##D s <- data.frame(p1=0.1^rep(8:2,each=7,times=1),n1=rep(32000,49),
##D                 p2=0.1^rep(8:2,each=1,times=7),n2=rep(8000,49))
##D cbind(s,metap(s,2))
##D 
##D # Speliotes, Elizabeth K., M.D. [ESPELIOTES@PARTNERS.ORG]
##D # 22-2-2008 MRC-Epid JHZ
##D 
##D np <- 7
##D p <- 0.1^((np+1):2)
##D z <- qnorm(1-p/2)
##D n <- c(32000,8000)
##D n1 <- n[1]
##D 
##D s1 <- s2 <- vector("numeric")
##D 
##D for (i in 1:np)
##D {
##D    a <- z[i]
##D    for (j in 1:np)
##D    {
##D        b <- z[j]
##D        metaz1 <- (sqrt(n1)*a+sqrt(n[1])*b)/sqrt(n1+n[1])
##D        metap1 <- pnorm(-abs(metaz1))
##D        metaz2 <- (sqrt(n1)*a+sqrt(n[2])*b)/sqrt(n1+n[2])
##D        metap2 <- pnorm(-abs(metaz2))
##D        k <- (i-1)*np+j
##D        cat(k,"\t",p[i],"\t",p[j],"\t",metap1,metaz1,"\t",metap2,metaz2,"\n")
##D        s1[k] <- metap1
##D        s2[k] <- metap2
##D   }
##D }
##D 
##D q <- -log10(sort(p,decreasing=TRUE))
##D t1 <- matrix(-log10(sort(s1,decreasing=TRUE)),np,np)
##D t2 <- matrix(-log10(sort(s2,decreasing=TRUE)),np,np)
##D 
##D par(mfrow=c(1,2),bg="white",mar=c(4.2,3.8,0.2,0.2))
##D persp(q,q,t1)
##D persp(q,q,t2)
## End(Not run)



