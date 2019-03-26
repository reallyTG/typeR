library(gsDesign)


### Name: ssrCP
### Title: Sample size re-estimation based on conditional power
### Aliases: ssrCP plot.ssrCP Power.ssrCP condPower z2NC z2Z z2Fisher
### Keywords: design

### ** Examples

# Following is a template for entering parameters for ssrCP
# Natural parameter value null and alternate hypothesis values
delta0 <- 0
delta1 <- 1
# timing of interim analysis for underlying group sequential design
timing <- .5
# upper spending function 
sfu <- sfHSD
# upper spending function paramater
sfupar <- -12
# maximum sample size inflation
maxinflation <- 2
# assumed enrollment overrrun at IA
overrun <- 25
# interim z-values for plotting
z <- seq(0,4,.025)
# Type I error (1-sided)
alpha <- .025
# Type II error for design
beta <- .1
# Fixed design sample size
n.fix <- 100
# conditional power interval where sample 
# size is to be adjusted
cpadj <- c(.3,.9)
# targeted Type II error when adapting sample size
betastar <- beta
# combination test (built-in options are: z2Z, z2NC, z2Fisher)
z2 <- z2NC

# use the above parameters to generate design
# generate a 2-stage group sequential design with 
x<-gsDesign(k=2,n.fix=n.fix,timing=timing,sfu=sfu,sfupar=sfupar,
            alpha=alpha,beta=beta,delta0=delta0,delta1=delta1)
# extend this to a conditional power design
xx <- ssrCP(x=x,z1=z,overrun=overrun,beta=betastar,cpadj=cpadj,
        maxinc=maxinflation, z2=z2)
# plot the stage 2 sample size
plot(xx)
# demonstrate overlays on this plot
# overlay with densities for z1 under different hypotheses
lines(z,80+240*dnorm(z,mean=0),col=2)
lines(z,80+240*dnorm(z,mean=sqrt(x$n.I[1])*x$theta[2]),col=3)
lines(z,80+240*dnorm(z,mean=sqrt(x$n.I[1])*x$theta[2]/2),col=4)
lines(z,80+240*dnorm(z,mean=sqrt(x$n.I[1])*x$theta[2]*.75),col=5)
axis(side=4, at=80+240*seq(0,.4,.1), labels=as.character(seq(0,.4,.1))) 
mtext(side=4,expression(paste("Density for ",z[1])),line=2)
text(x=1.5,y=90,col=2,labels=expression(paste("Density for ",theta,"=0")))
text(x=3.00,y=180,col=3,labels=expression(paste("Density for ",theta,"=", theta[1])))
text(x=1.00,y=180,col=4,labels=expression(paste("Density for ",theta,"=", theta[1],"/2")))
text(x=2.5,y=140,col=5,labels=expression(paste("Density for ",theta,"=", theta[1],"*.75")))
# overall line for max sample size
nalt <- xx$maxinc*x$n.I[2]
lines(x=par("usr")[1:2],y=c(nalt,nalt),lty=2)

# compare above design with different combination tests
# use sufficient statistic for final testing
xxZ <- ssrCP(x=x,z1=z,overrun=overrun,beta=betastar,cpadj=cpadj,
        maxinc=maxinflation, z2=z2Z)
# use Fisher combination test for final testing
xxFisher <- ssrCP(x=x,z1=z,overrun=overrun,beta=betastar,cpadj=cpadj,
        maxinc=maxinflation, z2=z2Fisher)
# combine data frames from these designs
y <- rbind(
       data.frame(cbind(xx$dat,Test="Normal combination")),
       data.frame(cbind(xxZ$dat,Test="Sufficient statistic")),
       data.frame(cbind(xxFisher$dat,Test="Fisher combination")))
# plot stage 2 statistic required for positive combination test
ggplot(data=y,aes(x=z1,y=z2,col=Test))+geom_line()
# plot total sample size versus stage 1 test statistic
ggplot(data=y,aes(x=z1,y=n2,col=Test))+geom_line()
# check achieved Type I error for sufficient statistic design
Power.ssrCP(x=xxZ, theta=0)

# compare designs using observed vs planned theta for conditional power
xxtheta1 <- ssrCP(x=x,z1=z,overrun=overrun,beta=betastar,cpadj=cpadj,
        maxinc=maxinflation, z2=z2, theta=x$delta)
# combine data frames for the 2 designs
y <- rbind(
       data.frame(cbind(xx$dat,"CP effect size"="Obs. at IA")),
       data.frame(cbind(xxtheta1$dat,"CP effect size"="Alt. hypothesis")))
# plot stage 2 sample size by design
ggplot(data=y,aes(x=z1,y=n2,col=CP.effect.size))+geom_line()
# compare power and expected sample size
y1 <- Power.ssrCP(x=xx)
y2 <- Power.ssrCP(x=xxtheta1)
# combine data frames for the 2 designs
y3 <- rbind(
       data.frame(cbind(y1,"CP effect size"="Obs. at IA")),
       data.frame(cbind(y2,"CP effect size"="Alt. hypothesis")))
# plot expected sample size by design and effect size
ggplot(data=y3,aes(x=delta,y=en,col=CP.effect.size))+geom_line() + 
        xlab(expression(delta)) + ylab("Expected sample size")
# plot power by design and effect size
ggplot(data=y3,aes(x=delta,y=Power,col=CP.effect.size))+geom_line() + xlab(expression(delta))



