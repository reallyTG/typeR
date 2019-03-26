library(lessR)


### Name: style
### Title: Set the Default Color Theme and Other System Settings
### Aliases: style set
### Keywords: sets csv

### ** Examples


# some data
d <- rd("Employee", in.lessR=TRUE, quiet=TRUE)

# gold colors embedded in a black background
style("gold", sub.theme="black")
Plot(Years, Salary, size=0, ellipse=seq(.1,.9,.1))

# three ways to do gray scale
style(window.fill="white")
# 1. gray scale with a light gray background
style("gray")
# 2. gray scale with a dark, almost black, background
style("gray", sub.theme="black")
# 3. mostly black and white
style("white")

# reset style to the default "colors"
style()

# set bar fill to qualitative hcl colors
# here also turn off bar borders and set to a mild transparency
Histogram(Salary, fill="greens", color="off")
# same as
# style(bar.fill.ordered="greens", bar.color="off")
# Histogram(Salary)

# set bar fill to 6 blue colors
# for continuous band explicitly call getColors and specify n
#   to obtain the full spectrum, such as for analysis of Likert
#   scale responses with six possible responses per item
style(bar.fill=getColors("blues", n=6))

# adjust Trellis strip to a dark background
style(strip.fill="gray60", strip.color="gray20",
      strip.text.color=rgb(247,242,230, maxColorValue=255))
Plot(Years, Salary, by1=Gender)

# define a custom style beyond just colors
style(panel.fill="off", panel.color="off",
      window.fill=rgb(247,242,230, maxColorValue=255),
      pt.fill="black", trans=0,
      lab.color="black", axis.text.color="black",
      axis.y.color="off",
      grid.x.color="off", grid.y.color="black",  grid.lty="dotted", grid.lwd=1)
hs(Salary)

# save the current theme settings into an R object without changes
# unless set to FALSE, get is always TRUE, for all calls to style
mystyle <- style(get=TRUE)
# ...  bunch of changes
# then recall older settings to current theme setting
style(set=mystyle)

# create a gray-scale with a sub-theme of wsj
# save, and then at a later session read back in
grayWSJ <- style("gray", sub.theme="wsj")
Write("grayWSJ", data=grayWSJ, format="R")
# ...
mystyle <- Read("grayWSJ.rda")  # read grayWSJ.rda
style(set=mystyle)



# all numeric variables with 8 or less unique values and equally spaced
#  intervals are analyzed as categorical variables
style(n.cat=8)


