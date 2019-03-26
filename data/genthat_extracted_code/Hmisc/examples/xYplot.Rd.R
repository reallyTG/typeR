library(Hmisc)


### Name: xYplot
### Title: xyplot and dotplot with Matrix Variables to Plot Error Bars and
###   Bands
### Aliases: xYplot panel.xYplot prepanel.xYplot Dotplot panel.Dotplot
###   prepanel.Dotplot Cbind [.Cbind setTrellis numericScale
### Keywords: hplot

### ** Examples

# Plot 6 smooth functions.  Superpose 3, panel 2.
# Label curves with p=1,2,3 where most separated 
d <- expand.grid(x=seq(0,2*pi,length=150), p=1:3, shift=c(0,pi)) 
xYplot(sin(x+shift)^p ~ x | shift, groups=p, data=d, type='l') 
# Use a key instead, use 3 line widths instead of 3 colors 
# Put key in most empty portion of each panel
xYplot(sin(x+shift)^p ~ x | shift, groups=p, data=d, 
       type='l', keys='lines', lwd=1:3, col=1) 
# Instead of implicitly using labcurve(), put a 
# single key outside of panels at lower left corner
xYplot(sin(x+shift)^p ~ x | shift, groups=p, data=d, 
       type='l', label.curves=FALSE, lwd=1:3, col=1, lty=1:3) 
Key()

# Bubble plots
x <- y <- 1:8
x[2] <- NA
units(x) <- 'cm^2'
z <- 101:108
p <- factor(rep(c('a','b'),4))
g <- c(rep(1,7),2)
data.frame(p, x, y, z, g)
xYplot(y ~ x | p, groups=g, size=z)
 Key(other=list(title='g', cex.title=1.2))  # draw key for colors
sKey(.2,.85,other=list(title='Z Values', cex.title=1.2))
# draw key for character sizes

# Show the median and quartiles of height given age, stratified 
# by sex and race.  Draws 2 sets (male, female) of 3 lines per panel.
# xYplot(height ~ age | race, groups=sex, method='quantiles')


# Examples of plotting raw data
dfr <- expand.grid(month=1:12, continent=c('Europe','USA'), 
                   sex=c('female','male'))
set.seed(1)
dfr <- upData(dfr,
              y=month/10 + 1*(sex=='female') + 2*(continent=='Europe') + 
                runif(48,-.15,.15),
              lower=y - runif(48,.05,.15),
              upper=y + runif(48,.05,.15))


xYplot(Cbind(y,lower,upper) ~ month,subset=sex=='male' & continent=='USA',
       data=dfr)
xYplot(Cbind(y,lower,upper) ~ month|continent, subset=sex=='male',data=dfr)
xYplot(Cbind(y,lower,upper) ~ month|continent, groups=sex, data=dfr); Key() 
# add ,label.curves=FALSE to suppress use of labcurve to label curves where
# farthest apart


xYplot(Cbind(y,lower,upper) ~ month,groups=sex,
                              subset=continent=='Europe', data=dfr) 
xYplot(Cbind(y,lower,upper) ~ month,groups=sex, type='b',
                              subset=continent=='Europe', keys='lines',
                              data=dfr)
# keys='lines' causes labcurve to draw a legend where the panel is most empty


xYplot(Cbind(y,lower,upper) ~ month,groups=sex, type='b', data=dfr,
                              subset=continent=='Europe',method='bands') 
xYplot(Cbind(y,lower,upper) ~ month,groups=sex, type='b', data=dfr,
                              subset=continent=='Europe',method='upper')


label(dfr$y) <- 'Quality of Life Score'   
# label is in Hmisc library = attr(y,'label') <- 'Quality...'; will be
# y-axis label 
# can also specify Cbind('Quality of Life Score'=y,lower,upper) 
xYplot(Cbind(y,lower,upper) ~ month, groups=sex,
       subset=continent=='Europe', method='alt bars',
        offset=unit(.1,'inches'), type='b', data=dfr)   
# offset passed to labcurve to label .4 y units away from curve
# for R (using grid/lattice), offset is specified using the grid
# unit function, e.g., offset=unit(.4,'native') or
# offset=unit(.1,'inches') or unit(.05,'npc')


# The following example uses the summarize function in Hmisc to 
# compute the median and outer quartiles.  The outer quartiles are 
# displayed using "error bars"
set.seed(111)
dfr <- expand.grid(month=1:12, year=c(1997,1998), reps=1:100)
month <- dfr$month; year <- dfr$year
y <- abs(month-6.5) + 2*runif(length(month)) + year-1997
s <- summarize(y, llist(month,year), smedian.hilow, conf.int=.5) 
xYplot(Cbind(y,Lower,Upper) ~ month, groups=year, data=s, 
       keys='lines', method='alt', type='b')
# Can also do:
s <- summarize(y, llist(month,year), quantile, probs=c(.5,.25,.75),
               stat.name=c('y','Q1','Q3')) 
xYplot(Cbind(y, Q1, Q3) ~ month, groups=year, data=s, 
       type='b', keys='lines') 
# Or:
xYplot(y ~ month, groups=year, keys='lines', nx=FALSE, method='quantile',
       type='b') 
# nx=FALSE means to treat month as a discrete variable


# To display means and bootstrapped nonparametric confidence intervals 
# use:
s <- summarize(y, llist(month,year), smean.cl.boot) 
s
xYplot(Cbind(y, Lower, Upper) ~ month | year, data=s, type='b')
# Can also use Y <- cbind(y, Lower, Upper); xYplot(Cbind(Y) ~ ...) 
# Or:
xYplot(y ~ month | year, nx=FALSE, method=smean.cl.boot, type='b')


# This example uses the summarize function in Hmisc to 
# compute the median and outer quartiles.  The outer quartiles are 
# displayed using "filled bands"


s <- summarize(y, llist(month,year), smedian.hilow, conf.int=.5) 


# filled bands: default fill = pastel colors matching solid colors
# in superpose.line (this works differently in R)
xYplot ( Cbind ( y, Lower, Upper ) ~ month, groups=year, 
     method="filled bands" , data=s, type="l")


# note colors based on levels of selected subgroups, not first two colors
xYplot ( Cbind ( y, Lower, Upper ) ~ month, groups=year, 
     method="filled bands" , data=s, type="l",
     subset=(year == 1998 | year == 2000), label.curves=FALSE )


# filled bands using black lines with selected solid colors for fill
xYplot ( Cbind ( y, Lower, Upper ) ~ month, groups=year, 
     method="filled bands" , data=s, label.curves=FALSE,
     type="l", col=1, col.fill = 2:3)
Key(.5,.8,col = 2:3) #use fill colors in key


# A good way to check for stable variance of residuals from ols 
# xYplot(resid(fit) ~ fitted(fit), method=smean.sdl) 
# smean.sdl is defined with summary.formula in Hmisc


# Plot y vs. a special variable x
# xYplot(y ~ numericScale(x, label='Label for X') | country) 
# For this example could omit label= and specify 
#    y ~ numericScale(x) | country, xlab='Label for X'


# Here is an example of using xYplot with several options
# to change various Trellis parameters,
# xYplot(y ~ x | z, groups=v, pch=c('1','2','3'),
#        layout=c(3,1),     # 3 panels side by side
#        ylab='Y Label', xlab='X Label',
#        main=list('Main Title', cex=1.5),
#        par.strip.text=list(cex=1.2),
#        strip=function(...) strip.default(..., style=1),
#        scales=list(alternating=FALSE))


#
# Dotplot examples
#


s <- summarize(y, llist(month,year), smedian.hilow, conf.int=.5) 


setTrellis()            # blank conditioning panel backgrounds 
Dotplot(month ~ Cbind(y, Lower, Upper) | year, data=s) 
# or Cbind(...), groups=year, data=s


# Display a 5-number (5-quantile) summary (2 intervals, dot=median) 
# Note that summarize produces a matrix for y, and Cbind(y) trusts the 
# first column to be the point estimate (here the median) 
s <- summarize(y, llist(month,year), quantile,
               probs=c(.5,.05,.25,.75,.95), type='matrix') 
Dotplot(month ~ Cbind(y) | year, data=s) 
# Use factor(year) to make actual years appear in conditioning title strips

# Plot proportions and their Wilson confidence limits
set.seed(3)
d <- expand.grid(continent=c('USA','Europe'), year=1999:2001,
                 reps=1:100)
# Generate binary events from a population probability of 0.2
# of the event, same for all years and continents
d$y <- ifelse(runif(6*100) <= .2, 1, 0)
s <- with(d,
          summarize(y, llist(continent,year),
                    function(y) {
                     n <- sum(!is.na(y))
                     s <- sum(y, na.rm=TRUE)
                     binconf(s, n)
                    }, type='matrix')
)

Dotplot(year ~ Cbind(y) | continent,  data=s, ylab='Year',
        xlab='Probability')


# Dotplot(z ~ x | g1*g2)                 
# 2-way conditioning 
# Dotplot(z ~ x | g1, groups=g2); Key()  
# Key defines symbols for g2


# If the data are organized so that the mean, lower, and upper 
# confidence limits are in separate records, the Hmisc reShape 
# function is useful for assembling these 3 values as 3 variables 
# a single observation, e.g., assuming type has values such as 
# c('Mean','Lower','Upper'):
# a <- reShape(y, id=month, colvar=type) 
# This will make a matrix with 3 columns named Mean Lower Upper 
# and with 1/3 as many rows as the original data 



