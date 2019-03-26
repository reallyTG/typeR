library(lessR)


### Name: Histogram
### Title: Histogram
### Aliases: Histogram hs
### Keywords: histogram color

### ** Examples

# get the data
d <- rd("Employee", in.lessR=TRUE)


# make sure default style is active
style()


# --------------------
# different histograms
# --------------------

# histogram with all defaults
Histogram(Salary)
# short form
#hs(Salary)

# output saved for later analysis into object h
h <- hs(Salary)
# view full text output
h
# view just the outlier analysis
h$out_outliers
# list the names of all the components
names(h)

# histogram with no borders for the bars
Histogram(Salary, color="off")

# save the histogram to a pdf file
#Histogram(Salary, pdf=TRUE)

# just males employed more than 5 years
Histogram(Salary, rows=(Gender=="M" & Years > 5))

# histogram with red bars, black background, and black border
style(panel.fill="black", fill="red", panel.color="black")
Histogram(Salary)
# or use a lessR pre-defined sequential color palette
#   with some transparency
Histogram(Salary, fill="rusts", color="brown", trans=.1)

# histogram with purple color theme, translucent gold bars
style("purple", sub.theme="black")
Histogram(Salary)
# back to default color theme
style()

# histogram with specified bin width
# can also use bin.start
Histogram(Salary, bin.width=12000)

# histogram with rotated axis values, offset more from axis
# suppress text output
style(rotate.x=45, offset=1)
Histogram(Salary, quiet=TRUE)
style()

# histogram with specified bins and grid lines displayed over the histogram
Histogram(Salary, breaks=seq(0,150000,20000), xlab="My Variable")

# histogram with bins calculated with the Scott method and values displayed
Histogram(Salary, breaks="Scott", values=TRUE, quiet=TRUE)

# histogram with the number of suggested bins, with proportions
Histogram(Salary, breaks=15, prop=TRUE)

# histogram with non-default values for x- and y-axes
d[2,4] <- 45000
Histogram(Salary, scale.x=c(30000,130000,5), scale.y=c(0,9.5,5))

# ----------------
# Trellis graphics
# ----------------
Histogram(Salary, by1=Dept)


# ---------------------
# cumulative histograms
# ---------------------

# cumulative histogram with superimposed regular histogram, all defaults
Histogram(Salary, cumulate="both")

# cumulative histogram plus regular histogram
# present with proportions on vertical axis, override other defaults
Histogram(Salary, cumulate="both", prop=TRUE, reg="mistyrose")


# -------------------------------------------------
# histograms for data frames and multiple variables
# -------------------------------------------------

# create data frame, d, to mimic reading data with Read function
# d contains both numeric and non-numeric data
d <- data.frame(rnorm(50), rnorm(50), rnorm(50), rep(c("A","B"),25))
names(d) <- c("X","Y","Z","C")

# although data not attached, access the variable directly by its name
Histogram(X)

# histograms for all numeric variables in data frame called d
#  except for numeric variables with unique values < n.cat
# d is the default name, so does not need to be specified with data
Histogram()

# variable of interest is in a data frame which is not the default d
# access the breaks variable in the R provided warpbreaks data set
# although data not attached, access the variable directly by its name
Histogram(breaks, data=warpbreaks)

# histogram with specified options, including red axis labels
style(fill="palegreen1", panel.fill="ivory", axis.color="red") 
Histogram(values=TRUE)
style()  # reset

# histograms for all specified numeric variables
# use the combine or c function to specify a list of variables
Histogram(c(X,Y))


# -----------
# annotations
# -----------

d <- rd("Employee", in.lessR=TRUE)

# Place a message in the top-right of the graph
# Use \n to indicate a new line
hs(Salary, add="Salaries\nin our Company", x1=100000, y1=7)

# Use style to change some parameter values
style(add.trans=.8, add.fill="gold", add.color="gold4",
      add.lwd=0.5, add.cex=1.1)
# Add a rectangle around the message centered at <100000,7>
hs(Salary, add=c("rect", "Salaries\nin our Company"),
      x1=c(82000, 100000), y1=c(7.7, 7), x2=118000, y2=6.2)



