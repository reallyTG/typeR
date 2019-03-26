library(Hmisc)


### Name: panel.bpplot
### Title: Box-Percentile Panel Function for Trellis
### Aliases: panel.bpplot bpplotM bpplt bppltp
### Keywords: nonparametric hplot distribution

### ** Examples

set.seed(13)
x <- rnorm(1000)
g <- sample(1:6, 1000, replace=TRUE)
x[g==1][1:20] <- rnorm(20)+3   # contaminate 20 x's for group 1


# default trellis box plot
require(lattice)
bwplot(g ~ x)


# box-percentile plot with data density (rug plot)
bwplot(g ~ x, panel=panel.bpplot, probs=seq(.01,.49,by=.01), datadensity=TRUE)
# add ,scat1d.opts=list(tfrac=1) to make all tick marks the same size
# when a group has > 125 observations


# small dot for means, show only .05,.125,.25,.375,.625,.75,.875,.95 quantiles
bwplot(g ~ x, panel=panel.bpplot, cex.means=.3)


# suppress means and reference lines for lower and upper quartiles
bwplot(g ~ x, panel=panel.bpplot, probs=c(.025,.1,.25), means=FALSE, qref=FALSE)


# continuous plot up until quartiles ("Tootsie Roll plot")
bwplot(g ~ x, panel=panel.bpplot, probs=seq(.01,.25,by=.01))


# start at quartiles then make it continuous ("coffin plot")
bwplot(g ~ x, panel=panel.bpplot, probs=seq(.25,.49,by=.01))


# same as previous but add a spike to give 0.95 interval
bwplot(g ~ x, panel=panel.bpplot, probs=c(.025,seq(.25,.49,by=.01)))


# decile plot with reference lines at outer quintiles and median
bwplot(g ~ x, panel=panel.bpplot, probs=c(.1,.2,.3,.4), qref=c(.5,.2,.8))


# default plot with tick marks showing all observations outside the outer
# box (.05 and .95 quantiles), with very small ticks
bwplot(g ~ x, panel=panel.bpplot, nout=.05, scat1d.opts=list(frac=.01))


# show 5 smallest and 5 largest observations
bwplot(g ~ x, panel=panel.bpplot, nout=5)


# Use a scat1d option (preserve=TRUE) to ensure that the right peak extends 
# to the same position as the extreme scat1d
bwplot(~x , panel=panel.bpplot, probs=seq(.00,.5,by=.001), 
       datadensity=TRUE, scat1d.opt=list(preserve=TRUE))

# Add an extended box plot to an existing base graphics plot
plot(x, 1:length(x))
panel.bpplot(x, 1070, nogrid=TRUE, pch=19, height=15, cex.means=.5)

# Draw a prototype showing how to interpret the plots
bpplt()

# Example for bpplotM
set.seed(1)
n <- 800
d <- data.frame(treatment=sample(c('a','b'), n, TRUE),
                sex=sample(c('female','male'), n, TRUE),
                age=rnorm(n, 40, 10),
                bp =rnorm(n, 120, 12),
                wt =rnorm(n, 190, 30))
label(d$bp) <- 'Systolic Blood Pressure'
units(d$bp) <- 'mmHg'
bpplotM(age + bp + wt ~ treatment, data=d)
bpplotM(age + bp + wt ~ treatment * sex, data=d, cex.strip=.8)
bpplotM(age + bp + wt ~ treatment*sex, data=d,
        violin=TRUE,
        violin.opts=list(col=adjustcolor('blue', alpha.f=.15),
                         border=FALSE))


bpplotM(c('age', 'bp', 'wt'), groups='treatment', data=d)
# Can use Hmisc Cs function, e.g. Cs(age, bp, wt)
bpplotM(age + bp + wt ~ treatment, data=d, nloc='left')

# Without treatment: bpplotM(age + bp + wt ~ 1, data=d)

## Not run: 
##D # Automatically find all variables that appear to be continuous
##D getHdata(support)
##D bpplotM(data=support, group='dzgroup',
##D         cex.strip=.4, cex.means=.3, cex.n=.45)
##D 
##D # Separate displays for categorical vs. continuous baseline variables
##D getHdata(pbc)
##D pbc <- upData(pbc, moveUnits=TRUE)
##D 
##D s <- summaryM(stage + sex + spiders ~ drug, data=pbc)
##D plot(s)
##D Key(0, .5)
##D s <- summaryP(stage + sex + spiders ~ drug, data=pbc)
##D plot(s, val ~ freq | var, groups='drug', pch=1:3, col=1:3,
##D      key=list(x=.6, y=.8))
##D 
##D bpplotM(bili + albumin + protime + age ~ drug, data=pbc)
## End(Not run)



