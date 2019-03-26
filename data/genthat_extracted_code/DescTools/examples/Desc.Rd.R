library(DescTools)


### Name: Desc
### Title: Describe Data
### Aliases: Desc Desc.default Desc.data.frame Desc.list Desc.formula
###   Desc.numeric Desc.integer Desc.factor Desc.ordered Desc.character
###   Desc.logical Desc.Date Desc.table print.Desc plot.Desc
### Keywords: print univar multivariate

### ** Examples

# implemented classes:
Desc(d.pizza$wrongpizza)               # logical
Desc(d.pizza$driver)                   # factor
Desc(d.pizza$quality)                  # ordered factor
Desc(as.character(d.pizza$driver))     # character
Desc(d.pizza$week)                     # integer
Desc(d.pizza$delivery_min)             # numeric
Desc(d.pizza$date)                     # Date

Desc(d.pizza)

Desc(d.pizza$wrongpizza, main="The wrong pizza delivered", digits=5)

Desc(table(d.pizza$area))                                    # 1-dim table
Desc(table(d.pizza$area, d.pizza$operator))                  # 2-dim table
Desc(table(d.pizza$area, d.pizza$operator, d.pizza$driver))  # n-dim table

# expressions
Desc(log(d.pizza$temperature))
Desc(d.pizza$temperature > 45)

# supported labels
Label(d.pizza$temperature) <- "This is the temperature in degrees Celsius
measured at the time when the pizza is delivered to the client."
Desc(d.pizza$temperature)
# try as well:      Desc(d.pizza$temperature, wrd=GetNewWrd())

z <- Desc(d.pizza$temperature)
print(z, digits=1, plotit=FALSE)
# plot (additional arguments are passed on to the underlying plot function)
plot(z, main="The pizza's temperature in Celsius", args.hist=list(breaks=50))


# bivariate
Desc(price ~ operator, data=d.pizza)                  # numeric ~ factor
Desc(driver ~ operator, data=d.pizza)                 # factor ~ factor
Desc(driver ~ area + operator, data=d.pizza)          # factor ~ several factors
Desc(driver + area ~ operator, data=d.pizza)          # several factors ~ factor
Desc(driver ~ week, data=d.pizza)                     # factor ~ integer

Desc(driver ~ operator, data=d.pizza, rfrq=("111"))   # alle rel. frequencies
Desc(driver ~ operator, data=d.pizza, rfrq=("000"),
     verbose="high")                                  # no rel. frequencies

Desc(price ~ delivery_min, data=d.pizza)              # numeric ~ numeric
Desc(price + delivery_min ~ operator + driver + wrongpizza,
     data=d.pizza, digits=c(2,2,2,2,0,3,0,0) )

Desc(week ~ driver, data=d.pizza, digits=c(2,2,2,2,0,3,0,0))   # define digits

Desc(delivery_min + weekday ~ driver, data=d.pizza)


# without defining data-parameter
Desc(d.pizza$delivery_min ~ d.pizza$driver)


# with functions and interactions
Desc(sqrt(price) ~ operator : factor(wrongpizza), data=d.pizza)
Desc(log(price+1) ~ cut(delivery_min, breaks=seq(10,90,10)),
     data=d.pizza, digits=c(2,2,2,2,0,3,0,0))

# response versus all the rest
Desc(driver ~ ., data=d.pizza[, c("temperature","wine_delivered","area","driver")])

# all the rest versus response
Desc(. ~ driver, data=d.pizza[, c("temperature","wine_delivered","area","driver")])

# pairwise Descriptions
p <- CombPairs(c("area","count","operator","driver","temperature","wrongpizza","quality"), )
for(i in 1:nrow(p))
  print(Desc(formula(gettextf("%s ~ %s", p$X1, p$X2)), data=d.pizza))


# get more flexibility, create the table first
tab <- as.table(apply(HairEyeColor, c(1,2), sum))
tab <- tab[,c("Brown","Hazel","Green","Blue")]

# display only absolute values, row and columnwise percentages
Desc(tab, row.vars=c(3, 1), rfrq="011", plotit=FALSE)

# do the plot by hand, while setting the colours for the mosaics
cols1 <- SetAlpha(c("sienna4", "burlywood", "chartreuse3", "slategray1"), 0.6)
cols2 <- SetAlpha(c("moccasin", "salmon1", "wheat3", "gray32"), 0.8)
plot(tab, col1=cols1, col2=cols2)


# use global format options for presentation
Fmt(abs=as.fmt(digits=0, big.mark=""))
Fmt(per=as.fmt(digits=2, fmt="%"))
Desc(area ~ driver, d.pizza, plotit=FALSE)

Fmt(abs=as.fmt(digits=0, big.mark="'"))
Fmt(per=as.fmt(digits=3, leading="drop"))
Desc(area ~ driver, d.pizza, plotit=FALSE)

# plot arguments can be fixed in detail
z <- Desc(BoxCox(d.pizza$temperature, lambda = 1.5))
plot(z, mar=c(0, 2.1, 4.1, 2.1), args.rug=TRUE, args.hist=list(breaks=50),
     args.dens=list(from=0))

# The default description for count variables can be inappropriate,
# the density curve does not represent the variable well.
set.seed(1972)
x <- rpois(n = 500, lambda = 5)
Desc(x)
# but setting maxrows to Inf gives a better plot
Desc(x, maxrows = Inf)


# Output into word document (Windows-specific example) -----------------------
# by simply setting wrd=GetNewWrd()
## Not run: 
##D 
##D   # create a new word instance and insert title and contents
##D   wrd <- GetNewWrd(header=TRUE)
##D 
##D   # let's have a subset
##D   d.sub <- d.pizza[,c("driver", "date", "operator", "price", "wrongpizza")]
##D 
##D   # do just the univariate analysis
##D   Desc(d.sub, wrd=wrd)
## End(Not run)




