library(coxrt)


### Name: coxph.RT.a0
### Title: Fits Cox Regression with Adjustment for the Lack of Positivity
### Aliases: coxph.RT.a0

### ** Examples

# loading AIDS data set
library(gss)
data(aids)
s <- data.frame(age=aids$age, ageg=as.numeric(aids$age<=4), T=aids$incu, R=aids$infe)
s$T[s$T==0] <- 0.5 # as in Kalbfeisch and Lawless (1989)

# analysis using adjusted estimating equations for a0=0.2
sol.02 <- try(coxph.RT.a0(T~ageg, right=R, data=s, a0=0.2, bs=FALSE))
sol.02
# for a0=0
sol <- try(coxph.RT(T~ageg, right=R, data=s, bs=FALSE) )
sol$summary # print the summary of fit based on the asymptotic SE estimate


# senstivity analysis for different values of a0
a_ <- seq(0.05, 0.55, by=0.05)
est <- NULL

for(q in 1:length(a_))
{
  sol.a <- try(coxph.RT.a0(T~ageg, right=R, data=s, a0=a_[q], bs=FALSE))
  if (sol.a$convergence!=0)
  {
    cat("a0=", a_[q], ". Error occurred in BBsolve.\n")
  } else
  {
    cat("a=", a_[q]," ", " IPW.adj.est=", sol.a$coef, "\n")
    est <- c(est, sol.a$coef)
  }
}
require(ggplot2)
res.d <- data.frame(a0=c(0, a_), beta=c(sol$coef, est))

p <- ggplot(res.d, aes(x=a0, y=beta)) +
  geom_line() + geom_point() +
  geom_hline(yintercept=0)
p + xlab(expression( paste(a[0], "=P(T>", r['*']," | z=0)" , sep="")) )+
  ylab(expression( paste(hat(beta), "(", a[0], ")" , sep="")) ) +
  scale_x_continuous(breaks=res.d$a0, labels=res.d$a0) +
  theme(axis.text.x = element_text(face="bold", angle=45),
        axis.text.y = element_text(face="bold"))




