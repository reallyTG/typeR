library(gsDesign)


### Name: sfTruncated
### Title: 4.7a: Truncated, trimmed and gapped spending functions
### Aliases: sfTruncated sfTrimmed sfGapped
### Keywords: design

### ** Examples


# Eliminate efficacy spending forany interim at or before 20 percent of information.
# Complete spending at first interim at or after 80 percent of information.
tx <- (0:100)/100
s<-sfHSD(alpha=.05,t=tx,param=1)$spend
x <- data.frame(t=tx,Spending=s,sf="Original spending")
param <- list(trange=c(.2,.8),sf=sfHSD,param=1)
s<-sfTruncated(alpha=.05,t=tx,param=param)$spend
x <- rbind(x, data.frame(t=tx,Spending=s,sf="Truncated"))
s<-sfTrimmed(alpha=.05,t=tx,param=param)$spend
x <- rbind(x, data.frame(t=tx,Spending=s,sf="Trimmed"))
s <- sfGapped(alpha=.05,t=tx,param=param)$spend
x <- rbind(x, data.frame(t=tx,Spending=s,sf="Gapped"))
ggplot(x,aes(x=t,y=Spending,col=sf))+geom_line()


# now apply the sfTrimmed version in gsDesign
# initially, eliminate the early efficacy analysis
# note: final spend must occur at > next to last interim
x<-gsDesign(k=4, n.fix=100, sfu=sfTrimmed, 
            sfupar=list(sf=sfHSD, param=1, trange=c(.3,.9)))

# first upper bound=20 means no testing there
gsBoundSummary(x)

# now, do not eliminate early efficacy analysis
param <- list(sf=sfHSD, param=1, trange=c(0,.9))
x<-gsDesign(k=4, n.fix=100, sfu=sfTrimmed, sfupar=param)

# The above means if final analysis is done a little early, all spending can occur
# Suppose we set calendar date for final analysis based on 
# estimated full information, but come up with only 97 pct of plan
xA <- gsDesign(k=x$k, n.fix=100, n.I=c(x$n.I[1:3],.97*x$n.I[4]),
               test.type=x$test.type, 
               maxn.IPlan=x$n.I[x$k],
               sfu=sfTrimmed, sfupar=param)
# now accelerate without the trimmed spending function
xNT<- gsDesign(k=x$k, n.fix=100, n.I=c(x$n.I[1:3],.97*x$n.I[4]),
               test.type=x$test.type, 
               maxn.IPlan=x$n.I[x$k],
               sfu=sfHSD, sfupar=1)
# Check last bound if analysis done at early time 
x$upper$bound[4]
# Now look at last bound if done at early time with trimmed spending function
# that allows capture of full alpha
xA$upper$bound[4]
# With original spending function, we don't get full alpha and therefore have
# unnecessarily stringent bound at final analysis
xNT$upper$bound[4]

# note that if the last analysis is LATE, all 3 approaches should give the same
# final bound that has a little larger z-value
xlate <- gsDesign(k=x$k, n.fix=100, n.I=c(x$n.I[1:3],1.25*x$n.I[4]),
               test.type=x$test.type, 
               maxn.IPlan=x$n.I[x$k],
               sfu=sfHSD, sfupar=1)
xlate$upper$bound[4]

# eliminate futility after the first interim analysis
# note that by setting trange[1] to .2, the spend at t=.2 is used for the first
# interim at or after 20 percent of information
x <- gsDesign(n.fix=100,sfl=sfGapped,sflpar=list(trange=c(.2,.9),sf=sfHSD,param=1))




