## ----fig1, echo=FALSE, label=fig1, fig.cap="Figure 1. Illustration of retrospective ascertainment of AIDS cases", out.width = '100%'----
    knitr::include_graphics('slide1.png')

## ----fig2, echo=FALSE, fig.cap="Figure 2. Right truncation causes distortion of the original distribution of T", out.width = '70%'----
    knitr::include_graphics('densTpTsRp.png')

## ----fig.height=4, fig.width=4, fig.align='center',  fig.cap="Figure 3. Two sub-populations defined by a covariate Z."----
library(ggplot2)
library(survival)
set.seed(17)
N <- 20000
Z <- as.numeric(runif(N,0,1) < 0.5)				# binary explanatory variable     
X <-rweibull(N, shape=3, scale=1*exp(-(2*Z)/3))	# shape a=3, scale b=1, beta=2
m <- max(X)
d.tr <- data.frame(time=c(X), variable=c(Z))
d.tr$variable=as.factor(d.tr$variable)
levels(d.tr$variable) <- c( "T | Z=0", "T | Z=1", " ")
p <- ggplot(d.tr) +
  geom_density(aes(x=time, color=variable, fill=variable), alpha=0.5) + 
  scale_color_brewer(palette = "Set1")+
  scale_fill_brewer(palette = "Set1")+
  theme_classic() +
  labs(x = "time")+
  ggtitle("In the population")+
  theme(axis.text.x = element_text(face="bold"),
        axis.text.y = element_text(face="bold"),
        plot.title = element_text(hjust = 0.5) )+ xlim(0, m)
p

## ------------------------------------------------------------------------

  set.seed(0)
  r <- runif(N, 0, m)
  ind <- X<r
  cat("P(T<R) = selection probability = ", mean(ind), "\n")
  d.tr <- data.frame(time=c(X[ind],r), variable=c(Z[ind], rep(3, N)))
  d.tr$variable=as.factor(d.tr$variable)
  levels(d.tr$variable) <- c( "T* | Z*=0", "T* | Z*=1", "R")

## ----fig.height=4, fig.width=4, echo=FALSE, fig.align='center',  fig.cap="Figure 4. Sample distributions under right truncation and positivity."----
    p <- ggplot(d.tr) +
    geom_density(aes(x=time, color=variable, fill=variable), alpha=0.5) + 
    scale_color_brewer(palette = "Set1")+
    scale_fill_brewer(palette = "Set1")+
    theme_classic() +
    labs(x = "time")+
      ggtitle(paste("In the sample with R~U[0,", round(m,1), "]", sep=""))+
    theme(axis.text.x = element_text(face="bold"),
          axis.text.y = element_text(face="bold"),
        plot.title = element_text(hjust = 0.5)  ) + xlim(0, m) #+ ylim(0,6.3)
  p

## ----fig.height=4, fig.width=4, echo=FALSE, fig.align='center', fig.cap="Figure 5. Sample distributions under mild violation of positivity."----
  
set.seed(0)
  r <- runif(N, 0, m/2)
  ind <- X<r
  d.tr <- data.frame(time=c(X[ind],r), variable=c(Z[ind], rep(3, N)))
  d.tr$variable=as.factor(d.tr$variable)
  levels(d.tr$variable) <- c( "T* | Z*=0", "T* | Z*=1", "R")
  
  p <- ggplot(d.tr) +
    geom_density(aes(x=time, color=variable, fill=variable), alpha=0.5) + 
    scale_color_brewer(palette = "Set1")+
    scale_fill_brewer(palette = "Set1")+
    theme_classic() +
    labs(x = "time")+
      ggtitle(paste("In the sample with R~U[0,", round(m/2,1), "]", sep=""))+
    theme(axis.text.x = element_text(face="bold"),
          axis.text.y = element_text(face="bold"),
        plot.title = element_text(hjust = 0.5)  ) + xlim(0, m) #+ ylim(0,6.3)
  p

## ----fig.height=4, fig.width=4, echo=FALSE,  fig.align='center', fig.cap="Figure 6. Sample distributions under severe violation of positivity."----
  set.seed(0)
  r <- runif(N, 0, m*4/20)
  ind <- X<r
  d.tr <- data.frame(time=c(X[ind],r), variable=c(Z[ind], rep(3, N)))
  d.tr$variable=as.factor(d.tr$variable)
  levels(d.tr$variable) <- c( "T* | Z*=0", "T* | Z*=1", "R")
  
  p <- ggplot(d.tr) +
    geom_density(aes(x=time, color=variable, fill=variable), alpha=0.5) + 
    scale_color_brewer(palette = "Set1")+
    scale_fill_brewer(palette = "Set1")+
    theme_classic() +
    labs(x = "time")+
      ggtitle(paste("In the sample with R~U[0,", round(m*4/20,1), "]", sep=""))+
    theme(axis.text.x = element_text(face="bold"),
          axis.text.y = element_text(face="bold"),
        plot.title = element_text(hjust = 0.5)  ) + xlim(0, m) #+ ylim(0,6.3)
  p

## ---- warning=FALSE, results='asis'--------------------------------------
library(gss)
library(coxrt)
data(aids)
s <- data.frame(age=aids$age, ageg=as.numeric(aids$age<=4), T=aids$incu, R=aids$infe)
s$T[s$T==0] <- 0.5 # as in Kalbfeisch and Lawless (1989)
# analysis assuming positivity
# we request bootstrap estimate of Asymptotic Standard Error (ASE) as well:
sol <- try(coxph.RT(T~ageg, right=R, data=s, bs=TRUE, nbs.rep=500) )
knitr::kable(sol$summary) # print the summary of fit based on the analytic ASE
knitr::kable(sol$bs$summary) # print the summary of fit based on the bootstrap sample distribution

## ---- warning=FALSE, results='asis'--------------------------------------
# analysis using adjusted estimating equations for a0=0.2
sol.02 <- try(coxph.RT.a0(T~ageg, right=R, data=s, a0=0.2, bs=TRUE, nbs.rep = 500))
knitr::kable(round(sol.02$bs$summary,2)) 

## ---- warning=FALSE------------------------------------------------------
# for a0=0:
sol <- try(coxph.RT(T~ageg, right=R, data=s, bs=FALSE) )
# senstivity analysis for different values of a0
a_ <- seq(0.05, 0.55, by=0.05)
est <- CI.L <- CI.U <- NULL
start_time <- Sys.time()
for(q in 1:length(a_))
{
 sol.a <- try(coxph.RT.a0(T~ageg, right=R, data=s, a0=a_[q], bs=TRUE))
 if (sol.a$convergence!=0)
 {
   cat("a0=", a_[q], ". Error occurred in BBsolve.\n")
 } else
 {
   est <- c(est, sol.a$coef)
   CI.L <- c(CI.L, sol.a$bs$summary$CI.L)
   CI.U <- c(CI.U, sol.a$bs$summary$CI.U)
 }
}
end_time <- Sys.time()
end_time - start_time # It takes some time to solve nonlinear estimating equations and to run bootstrap for each value of a0 ...

## ---- warning=FALSE, results='asis', fig.height=5, fig.width=5, fig.align='center', fig.cap="Figure 7. Sensitivity analysis for AIDS data"----
require(ggplot2)
res.d <- data.frame(a0=c(0, a_), beta=c(sol$coef, est),
                   L.95=c(sol$summary$CI.L, CI.L), U.95=c(sol$summary$CI.U, CI.U))
knitr::kable(round(res.d, 2)) 
p <- ggplot(res.d, aes(x=a0, y=beta)) +
 geom_ribbon(aes(ymin=L.95, ymax=U.95), alpha=0.2) +
 geom_line() + geom_point() +
 geom_hline(yintercept=0)
p + xlab(expression( paste(a[0], "=P(T>", r['*']," | z=0)" , sep="")) )+
 ylab(expression( paste(hat(beta), "(", a[0], ")" , sep="")) ) +
 scale_x_continuous(breaks=res.d$a0, labels=res.d$a0) +
 theme(axis.text.x = element_text(face="bold", angle=45),
         axis.text.y = element_text(face="bold"))

