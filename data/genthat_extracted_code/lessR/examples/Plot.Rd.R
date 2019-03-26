library(lessR)


### Name: Plot
### Title: Plot One or Two Continuous and/or Categorical Variables
### Aliases: Plot pl ScatterPlot sp BoxPlot bx ViolinPlot vp
### Keywords: plot color grouping variable

### ** Examples

# read the data
d <- rd("Employee", in.lessR=TRUE, quiet=TRUE)
d <- Subset(random=.6, quiet=TRUE)  # less computationally intensive

#---------------------------------------------------
# traditional scatterplot with two numeric variables
#---------------------------------------------------

# scatterplot with all defaults
Plot(Years, Salary)
# or use abbreviation sp in place of Plot
# or use full expression ScatterPlot in place of Plot

# maximum information, minimum input: scatterplot +
#  means, outliers, ellipse, least-squares lines with and w/o outliers
Plot(Years, Salary, enhance=TRUE)


## No test: 

# just males employed more than 5 years
Plot(Years, Salary, rows=(Gender=="M" & Years > 5))

# plot 0.95 data ellipse with the points identified that represent
#   outliers defined by a Mahalanobis Distance larger than 6 
# save outliers into R object out, then remove from d
d[1, "Salary"] <- 200000
out <- Plot(Years, Salary, ellipse=0.95, MD.cut=6)
d <- d[-out$outlier_indices,]

# new shape and point size, no grid or background color
# then put style back to default
style(panel.fill="powderblue", grid.color="off")
Plot(Years, Salary, size=2, shape="diamond")
style()

# translucent data ellipses without points or edges
#  show the idealized joint distribution for bivariate normality
style(ellipse.color="off")
Plot(Years, Salary, size=0, ellipse=seq(.1,.9,.10))
style()

# bubble plot with size determined by the value of Pre
# display the value for the bubbles with values of  min, median and max
Plot(Years, Salary, size=Pre, size.cut=3)

# variables in a data frame not the default d
# plot 0.6 and 0.9 data ellipses with partially transparent points
# change color theme to gold with black background
style("gold", sub.theme="black")
Plot(eruptions, waiting, trans=.5, ellipse=seq(.6,.9), data=faithful)

# scatterplot with two x-variables, plotted against Salary
# define a new style, then back to default
style(window.fill=rgb(247,242,230, maxColorValue=255),
  panel.fill="off", panel.color="off", pt.fill="black", trans=0,
  lab.color="black", axis.text.color="black",
  axis.y.color="off", grid.x.color="off", grid.y.color="black",
  grid.lty="dotted", grid.lwd=1)
Plot(c(Pre, Post), Salary)
style()

# increase span (smoothing) from default of .7 to 1.25
# span is a loess parameter, which generates a caution that can be
#   ignored that it is not a graphical parameter -- we know that
# display confidence intervals about best-fit line at
#   0.95 confidence level
Plot(Years, Salary, fit="loess", span=1.25)

# 2-D kernel density (more useful for larger sample sizes) 
Plot(Years, Salary, smooth=TRUE)
## End(No test)

#------------------------------------------------------
# scatterplot matrix from a vector of numeric variables
#------------------------------------------------------

# with least squares fit line
Plot(c(Salary, Years, Pre), fit="lm")


#--------------------------------------------------------------
# Trellis graphics and by for groups with two numeric variables
#--------------------------------------------------------------

# Trellis plot with condition on 1-variable
Plot(Years, Salary, by1=Dept)

## No test: 

# all three by variables
Plot(Years, Salary, by1=Dept, by2=Gender, by=Plan)

# vary both shape and color with a least-squares fit line for each group
style(color=c("darkgreen", "brown"))
Plot(Years, Salary, by1=Gender, fit="lm", shape=c("F","M"), size=.8)
style("gray")

# compare the men and women Salary according to Years worked
#   with an ellipse for each group
Plot(Years, Salary, by=Gender, ellipse=.50)
## End(No test)

#--------------------------------------------------
# analysis of a single numeric variable (or vector)
#--------------------------------------------------

# One continuous variable
# -----------------------
# integrated Violin/Box/Scatterplot, a VBS plot
Plot(Salary)

## No test: 

# by variable, different colors for different values of the variable
# all on one panel
Plot(Salary, by=Dept)

# large sample size
x <- rnorm(10000)
Plot(x)

# custom colors for outliers, which might not appear in this subset data
style(out.fill="hotpink", out2.fill="purple")
Plot(Salary)
style()

# no violin plot or scatterplot, just a boxplot
Plot(Salary, vbs.plot="b")
# or, the same with the mnemonic
BoxPlot(Salary)

# two related displays of box plots for different levels of a
#   categorical variable
BoxPlot(Salary, by1=Dept)


# binned values to plot counts
# ----------------------------
# bin the values of Salary to plot counts as a frequency polygon
# the counts are plotted as points instead of the data
Plot(Salary, stat="count")  # bin the values

# time charts
#------------
# run chart, with fill area
Plot(Salary, run=TRUE, area=TRUE)

# two run charts in same plot
# or could do a multivariate time series
Plot(c(Pre, Post), run=TRUE)

# Trellis graphics run chart with custom line width, no points
Plot(Salary, run=TRUE, by1=Gender, lwd=3, size=0)

# daily time series plot
# create the daily time series from R built-in data set airquality
oz.ts <- ts(airquality$Ozone, start=c(1973, 121), frequency=365)
Plot(oz.ts)

# multiple time series plotted from dates and stacked
# black background with translucent areas, then reset theme to default
style(sub.theme="black", color="steelblue2", trans=.55, 
  window.fill="gray10", grid.color="gray25")
date <- seq(as.Date("2013/1/1"), as.Date("2016/1/1"), by="quarter")
x1 <- rnorm(13, 100, 15)
x2 <- rnorm(13, 100, 15)
x3 <- rnorm(13, 100, 15)
df <- data.frame(date, x1, x2, x3)
rm(date); rm(x1); rm(x2); rm(x3)
Plot(date, x1:x3, data=df)
style()

# trigger a time series with a Date variable specified first
# stock prices for three companies by month:  Apple, IBM, Intel
d <- rd("StockPrice", in.lessR=TRUE)
# only plot Apple
Plot(date, Price, rows=(Company=="Apple"))
# Trellis plots, one for each company
Plot(date, Price, by1=Company, n.col=1)
# all three plots on the same panel, three shades of blue
Plot(date, Price, by=Company, color="blues")
## End(No test)

#------------------------------------------
# analysis of a single categorical variable
#------------------------------------------
d <- rd("Employee", in.lessR=TRUE)

# default 1-D bubble plot
# frequency plot, replaces bar chart 
Plot(Dept)

## No test: 

# abbreviated category labels
Plot(Dept, label.max=2)

# plot of frequencies for each category (level), replaces bar chart 
Plot(Dept, stat="count")


#----------------------------------------------------
# scatterplot of numeric against categorical variable 
#----------------------------------------------------

# generate a chart with the plotted mean of each level
# rotate x-axis labels and then offset from the axis
style(rotate.x=45, offset=1)
Plot(Dept, Salary)
style()


#-------------------
# Cleveland dot plot 
#-------------------

# row.names on the y-axis
Plot(Salary, row.names)

# standard scatterplot
Plot(Salary, row.names, sort.yx=FALSE, segments.y=FALSE)

# Cleveland dot plot with two x-variables
Plot(c(Pre, Post), row.names)


#------------
# annotations
#------------

# add text at the one location specified by x1 and x2
Plot(Years, Salary, add="Hi There", x1=12, y1=80000)
# add text at three different specified locations 
Plot(Years, Salary, add="Hi", x1=c(12, 16, 18), y1=c(80000, 100000, 60000))

# add three different text blocks at three different specified locations
Plot(Years, Salary, add=c("Hi", "Bye", "Wow"), x1=c(12, 16, 18),
  y1=c(80000, 100000, 60000))

# add an 0.95 data ellipse and horizontal and vertical lines through the
#  respective means
Plot(Years, Salary, ellipse=0.95, add=c("v.line", "h.line"),
  x1="mean.x", y1="mean.y")
# can be done also with the following short-hand
Plot(Years, Salary, ellipse=0.95, add=c("means"))
 
# a rectangle requires two points, four coordinates, <x1,y1> and <x2,y2>
style(add.trans=.8, add.fill="gold", add.color="gold4", add.lwd=0.5)
Plot(Years, Salary, add="rect", x1=12, y1=80000, x2=16, y2=115000)

# the first object, a rectangle, requires all four coordinates
# the vertical line at x=2 requires only an x1 coordinate, listed 2nd 
Plot(Years, Salary, add=c("rect", "v.line"), x1=c(10, 2),
  y1=80000, x2=12, y2=115000)

# two different rectangles with different locations, fill colors and translucence
style(add.fill=c("gold3", "green"), add.trans=c(.8,.4))
Plot(Years, Salary, add=c("rect", "rect"), 
  x1=c(10, 2), y1=c(60000, 45000), x2=c(12, 75000), y2=c(80000, 55000))
## End(No test)

#----------------------------------------------------
# analysis of two categorical variables (Likert data)
#----------------------------------------------------

d <- rd("Mach4", in.lessR=TRUE, quiet=TRUE)  # Likert data, 0 to 5

# size of each plotted point (bubble) depends on its joint frequency
# triggered by default when replication of joint values and
#   less than 9 unique data values for each 
# n.cat=6 means treat responses as categorical for up to 6 equally-spaced
#   integer values
Plot(m06, m07, n.cat=6)

# use value labels for the integer values, modify color options
LikertCats <- c("Strongly Disagree", "Disagree", "Slightly Disagree",
   "Slightly Agree", "Agree", "Strongly Agree")
style(fill="powderblue", color="blue", bubble.text="darkred")
Plot(m06,  m07, value.labels=LikertCats, n.cat=6)
style()  # reset theme

## No test: 

# proportions within each level of the other variable
Plot(m06, m07, proportion=TRUE, n.cat=6)

# get correlation analysis instead of cross-tab analysis
# rely upon the default value of n.cat=0 so that integer
#   valued variables are analyzed as numerical
Plot(m06, m07)

#-----------------------------
# Bubble Plot Frequency Matrix
#-----------------------------
# applies to categorical variables, since Mach IV Likert items
#   are 0 to 5 integer values, set n.cat to indicate the
#   numeric values represent categories
Plot(c(m06,m07,m09,m10), value.labels=LikertCats, n.cat=6)


#---------------
# function curve
#---------------

x <- seq(10,50,by=2) 
y1 <- sqrt(x)
y2 <- x**.33
# x is sorted with equal intervals so run chart by default
Plot(x, y1)

# multiple plots from variable vectors need to have the variables
#  in a data frame
d <- data.frame(x, y1, y2)
# if variables are in the user workspace and in a data frame
#   with the same names, the user workspace versions are used,
#   which do not work with vectors of variables, so remove
rm(x); rm(y1); rm(y2)
Plot(x, c(y1, y2))


#-----------
# modern art
#-----------
clr <- colors()  # get list of color names
color0 <- clr[sample(1:length(clr), size=1)]
clr <- clr[-(153:353)]  # get rid of most of the grays

n <- sample(5:30, size=1)
x <- rnorm(n)
y <- rnorm(n)
color1 <- clr[sample(1:length(clr), size=1)]
color2 <- clr[sample(1:length(clr), size=1)]

style(window.fill=color0, area.fill=color1, color=color2)
Plot(x, y, run=TRUE, area=TRUE,
  xy.ticks=FALSE, main="Modern Art", xlab="", ylab="",
  cex.main=2, col.main="lightsteelblue", n.cat=0, center.line="off")
style() # reset style to default
## End(No test)



