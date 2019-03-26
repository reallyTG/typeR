library(lessR)


### Name: Density
### Title: Density Curves from Data plus Histogram
### Aliases: Density dn
### Keywords: histogram density color

### ** Examples


# make sure default style is active
style()

# create data frame, d, to mimic reading data with Read function
# d contains both numeric and non-numeric data
d <- data.frame(rnorm(50), rnorm(50), rnorm(50), rep(c("A","B"),25))
names(d) <- c("X","Y","Z","C")

# normal curve and general density curves superimposed over histogram
# all defaults
Density(Y)

# short name
dn(Y)

# save the density plot to a pdf file
Density(Y, pdf=TRUE)

# specify (non-transparent) colors for the curves,
# to make transparent, need alpha option for the rgb function
Density(Y, color.nrm="darkgreen", color.gen="plum")

# rug with custom color and width of ticks
Density(Y, color.rug="steelblue", size.rug=1)

# display only the general estimated density
#  so do not display the estimated normal curve
# specify the bandwidth for the general density curve,
#  use the standard bw option for the density function
Density(Y, type="general", bw=.6)

# display only the general estimated density and a corresponding
#  interval of unit width around x.pt
Density(Y, type="general", x.pt=2)

# generate R markdown file to be "knit" such as in RStudio
dn(Y, Rmd="myout")

# variable of interest is in a data frame which is not the default d
# access the breaks variable in the R provided warpbreaks data set
# although data not attached, access the variable directly by its name
Density(breaks, data=warpbreaks)

# densities for all numeric variables in a data frame
Density()
# densities for an integer variable with less than n.cat equally
#  spaced values, so treat as numeric instead of categorical
# Density(n.cat=0)

# densities for all specified numeric variables in a list of variables
# e.g., use the combine or c function to specify a list of variables
Density(c(X,Y))



