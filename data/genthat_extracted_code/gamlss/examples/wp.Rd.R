library(gamlss)


### Name: wp
### Title: Worm plot
### Aliases: wp
### Keywords: regression

### ** Examples

data(abdom)
# with data
a<-gamlss(y~pb(x),sigma.fo=~pb(x,1),family=LO,data=abdom)
wp(a)
coeff1<-wp(a,xvar=x)
coeff1
## Not run: 
##D # no data argument
##D b <- gamlss(abdom$y~pb(abdom$x),sigma.fo=~pb(abdom$x),family=LO)
##D wp(b) 
##D wp(b, xvar=abdom$x)# not wp(b, xvar=x)
##D # using  the argument resid
##D # this will work
##D wp(resid=resid(a),  xvar=abdom$x)
##D # not this
##D # wp(resid=resid(a),  xvar=x)
##D # this example uses the rent data
##D m1 <- gamlss(R~pb(Fl)+pb(A)+loc, sigma.fo=~pb(Fl)+pb(A), data=rent, family=GA)
##D # a single worm plot
##D wp(m1, ylim.all=0.5)
##D # a single continuous x variable 
##D wp(m1, xvar=Fl, ylim.worm=.8)
##D # a single x variable changing the default number of intervals
##D wp(m1, xvar=Fl, ylim.worm=1.5, n.inter=9)
##D # different x variable changing the default number of intervals
##D B1<-wp(m1, xvar=A, ylim.worm=1.2, n.inter=9) 
##D B1
##D # the number five plot has intervals 
##D # [5,] 1957.5 1957.5 
##D # rather disappoining 
##D # try formula for xvar
##D wp(m1, xvar=~A, ylim.worm=1.2, n.inter=9)
##D # better in this case using formula
##D # now using a factor included in the model
##D wp(m1, xvar=~loc, ylim.worm=1.2, n.inter=9)
##D # using a factor notin the model
##D wp(m1, xvar=~B, ylim.worm=1.5, n.inter=9)
##D # level 2 (with B=1) did not fit well
##D # trying two continuous variable 
##D wp(m1, xvar=~Fl*A, ylim.worm=1.5, n.inter=4)
##D # one continuous and one categorical 
##D wp(m1, xvar=~Fl*loc, ylim.worm=1.5, n.inter=4)
##D # two categorical
##D wp(m1, xvar=~B*loc, ylim.worm=1.5, n.inter=4)
## End(Not run)




