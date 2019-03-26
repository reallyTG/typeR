library(Hmisc)


### Name: summaryP
### Title: Multi-way Summary of Proportions
### Aliases: summaryP plot.summaryP ggplot.summaryP latex.summaryP
### Keywords: hplot category manip

### ** Examples

n <- 100
f <- function(na=FALSE) {
  x <- sample(c('N', 'Y'), n, TRUE)
  if(na) x[runif(100) < .1] <- NA
  x
}
set.seed(1)
d <- data.frame(x1=f(), x2=f(), x3=f(), x4=f(), x5=f(), x6=f(), x7=f(TRUE),
                age=rnorm(n, 50, 10),
                race=sample(c('Asian', 'Black/AA', 'White'), n, TRUE),
                sex=sample(c('Female', 'Male'), n, TRUE),
                treat=sample(c('A', 'B'), n, TRUE),
                region=sample(c('North America','Europe'), n, TRUE))
d <- upData(d, labels=c(x1='MI', x2='Stroke', x3='AKI', x4='Migraines',
                 x5='Pregnant', x6='Other event', x7='MD withdrawal',
                 race='Race', sex='Sex'))
dasna <- subset(d, region=='North America')
with(dasna, table(race, treat))
s <- summaryP(race + sex + ynbind(x1, x2, x3, x4, x5, x6, x7, label='Exclusions') ~
              region + treat, data=d)
# add exclude1=FALSE below to include female category
plot(s, groups='treat')
ggplot(s, groups='treat')

plot(s, val ~ freq | region * var, groups='treat', outerlabels=FALSE)
# Much better looking if omit outerlabels=FALSE; see output at
# http://biostat.mc.vanderbilt.edu/HmiscNew#summaryP
# See more examples under bpplotM

## For plotly interactive graphic that does not handle variable size
## panels well:
## require(plotly)
## g <- ggplot(s, groups='treat')
## ggplotly(g, tooltip='text')

## For nice plotly interactive graphic:
## options(grType='plotly')
## s <- summaryP(race + sex + ynbind(x1, x2, x3, x4, x5, x6, x7,
##                                   label='Exclusions') ~
##               treat, data=subset(d, region='Europe'))
##
## plot(s, groups='treat', refgroup='A')  # refgroup='A' does B-A differences


# Make a chart where there is a block of variables that
# are only analyzed for males.  Keep redundant sex in block for demo.
# Leave extra space for numerators, denominators
sb <- summaryP(race + sex +
               pBlock(race, sex, label='Race: Males', subset=sex=='Male') ~
               region, data=d)
plot(sb, text.at=1.3)
plot(sb, groups='region', layout=c(1,3), key=list(space='top'),
     text.at=1.15)
ggplot(sb, groups='region')
## Not run: 
##D plot(s, groups='treat')
##D # plot(s, groups='treat', outerlabels=FALSE) for standard lattice output
##D plot(s, groups='region', key=list(columns=2, space='bottom'))
##D colorFacet(ggplot(s))
##D 
##D plot(summaryP(race + sex ~ region, data=d), exclude1=FALSE, col='green')
##D 
##D # Make your own plot using data frame created by summaryP
##D useOuterStrips(dotplot(val ~ freq | region * var, groups=treat, data=s,
##D         xlim=c(0,1), scales=list(y='free', rot=0), xlab='Fraction',
##D         panel=function(x, y, subscripts, ...) {
##D           denom <- s$denom[subscripts]
##D           x <- x / denom
##D           panel.dotplot(x=x, y=y, subscripts=subscripts, ...) }))
##D 
##D # Show marginal summary for all regions combined
##D s <- summaryP(race + sex ~ region, data=addMarginal(d, region))
##D plot(s, groups='region', key=list(space='top'), layout=c(1,2))
##D 
##D # Show marginal summaries for both race and sex
##D s <- summaryP(ynbind(x1, x2, x3, x4, label='Exclusions', sort=FALSE) ~
##D               race + sex, data=addMarginal(d, race, sex))
##D plot(s, val ~ freq | sex*race)
## End(Not run)



