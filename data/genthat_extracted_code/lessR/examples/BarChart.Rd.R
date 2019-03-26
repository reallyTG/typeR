library(lessR)


### Name: BarChart
### Title: Bar Chart for One or Two Variables
### Aliases: BarChart bc
### Keywords: bar chart color

### ** Examples


# get the data
d <- rd("Employee", in.lessR=TRUE)

# --------------------------------------------------------
# bar chart from tabulating the data for a single variable
# --------------------------------------------------------

# for each level of Dept, display the frequencies
BarChart(Dept)
# short name
# bc(Dept)

# save the values output by BarChart into the myOutput list
myOutput <- BarChart(Dept)
# display the saved output
myOutput

# just males with salaries larger than 75,000 USD
BarChart(Dept, rows=(Gender=="M" & Salary > 85000))

# rotate and offset the axis labels, sort categories by frequencies
BarChart(Dept, rotate.x=45, offset=1, sort="-")

# set bars to a single color of blue with some transparency
BarChart(Dept, fill="blue", trans=0.3)
# progressive (sequential) color scale of blues
BarChart(Dept, fill="blues")

# change the theme just for this analysis, as opposed to style()
BarChart(Dept, theme="darkgreen")

# set bar color to hcl custom hues with chroma and luminance
#   at the values provided by the default hcl colors from
#   the getColors function, which defaults to h=240 and h=60
#   for the first two colors on the qualitative scale
bc(Gender, fill=c(hcl(h=180,c=100,l=55), hcl(h=0,c=100,l=55)))

# or set to unique colors via color names
BarChart(Gender, fill=c("palegreen3","tan"))

# darken the colors with an explicit call to getColors,
#   do a lower value of luminance, set to l=25
BarChart(Dept, fill=getColors(l=25), trans=0.4)

# column proportions instead of frequencies
BarChart(Gender, proportion=TRUE)

# map value of tabulated count to bar fill<D-d>
BarChart(Dept, fill=(count))

# data with many values of categorical variable Make and large labels
myd <- Read("Cars93", in.lessR=TRUE)
# perpendicular labels
bc(Make, rotate.x=90, data=myd)
# manage size of horizontal value labels
bc(Make, horiz=TRUE, label.max=4, data=myd)

# wes anderson move theme palette
# see getColors help file to see the full list of themes
BarChart(Dept, fill="GrandBudapest1", values="off")

# display bars for values of count <= 10 in a different color
#  than values above
BarChart(Dept, sort="+", fill.split=10)


# ----------------------------------------------------
# bar chart from tabulating the data for two variables
# ----------------------------------------------------

# at each level of Dept, show the frequencies of the Gender levels
BarChart(Dept, by=Gender)

# at each level of Dept, show the row proportions of the Gender levels
#   i.e., proportional stacked bar graph
BarChart(Dept, by=Gender, proportion=TRUE)

# at each level of Gender, show the frequencies of the Dept levels
# do not display percentages directly on the bars
BarChart(Gender, by=JobSat, fill="reds", values="off")

# specify two fill colors for Gender
BarChart(Dept, by=Gender, fill=getColors(c("deepskyblue", "black")))

# specify an ordered customized blue palette of colors for Dept
# colors can be named or customized with rgb function
# here "azure" is a single color instead of a range (ends in s)
BarChart(Gender, by=Dept,
         fill=getColors("azure", end.clr=rgb(100,110,200,max=255)))

# display bars beside each other instead of stacked, Female and Male
# the levels of Dept are included within each respective bar
# plot horizontally, display the value for each bar at the
#   top of each bar
BarChart(Gender, by=Dept, beside=TRUE, horiz=TRUE, values.position="out")

# horizontal bar chart of two variables, put legend on the top
BarChart(Gender, by=Dept, horiz=TRUE, legend.position="top")

# for more info on base R graphic options, enter:  help(par)
# for lessR options, enter:  style(show=TRUE)
# here fill is set in the style function instead of BarChart
#   along with the others
style(fill=c("coral3","seagreen3"), lab.color="wheat4", lab.cex=1.2,
      panel.fill="wheat1", main.color="wheat4")
BarChart(Dept, by=Gender,
         legend.position="topleft", legend.labels=c("Girls", "Boys"),
         xlab="Dept Level", main="Gender for Different Dept Levels",
         value.labels=c("None", "Some", "Much", "Ouch!"))
style()


# -----------------------------------------------------------------
# multiple bar charts tabulated from data across multiple variables
# -----------------------------------------------------------------

# bar charts for all non-numeric variables in the data frame called d
#   and all numeric variables with a small number of values, < n.cat
# BarChart(one.plot=FALSE)

d <- rd("Mach4", in.lessR=TRUE, quiet=TRUE)

# all on the same plot, bar charts for 20 6-pt Likert scale items
# default scale is divergent from "browns" to "blues"
BarChart(m01:m20, horiz=TRUE, values="off", sort="+")


## No test: 

# custom scale with explicit call to getColors, HCL chroma at 50
clrs <- getColors("greens", "purples", n=6, c=50)
BarChart(m01:m20, horiz=TRUE, values="off", sort="+", fill=clrs)

# custom divergent scale with pre-defined color palettes
#  with implicit call to getColors
BarChart(m01:m20, horiz=TRUE, values="off", fill=c("aquas", "rusts"))


# ----------------------------
# can enter many types of data
# ----------------------------

# generate and enter integer data
X1 <- sample(1:4, size=100, replace=TRUE)
X2 <- sample(1:4, size=100, replace=TRUE)
BarChart(X1)
BarChart(X1, by=X2)

# generate and enter type double data
X1 <- sample(c(1,2,3,4), size=100, replace=TRUE)
X2 <- sample(c(1,2,3,4), size=100, replace=TRUE)
BarChart(X1)
BarChart(X1, by=X2)

# generate and enter character string data
# that is, without first converting to a factor
Travel <- sample(c("Bike", "Bus", "Car", "Motorcycle"), size=25, replace=TRUE)
BarChart(Travel, horiz=TRUE)


# ----------------------------
# bar chart directly from data
# ----------------------------

# include a y-variable, here Salary, in the data table to read directly
d <- read.csv(text="
Dept, Salary
ACCT,51792.78
ADMN,71277.12
FINC,59010.68
MKTG,60257.13
SALE,68830.06", header=TRUE)
BarChart(Dept, Salary)

# specify two variables for a two variable bar chart
# also specify a y-variable to provide the counts directly
d <- read.csv(text="
Dept,Gender,Count
ACCT,F,3
ACCT,M,2
ADMIN,F,4
ADMIN,M,2
FINC,F,1
FINC,M,3
MKTG,F,5
MKTG,M,1
SALE,F,5
SALE,M,10", header=TRUE)
BarChart(Dept, Count, by=Gender)


# -----------
# annotations
# -----------

d <- rd("Employee", in.lessR=TRUE)

# Place a message in the center of the plot
# \n indicates a new line
BarChart(Dept, add="Employees by\nDepartment", x1=3, y1=10)

# Use style to change some parameter values
style(add.trans=.8, add.fill="gold", add.color="gold4", add.lwd=0.5)
# Add a rectangle around the message centered at <3,10>
BarChart(Dept, add=c("rect", "Employees by\nDepartment"),
                     x1=c(2,3), y1=c(11, 10), x2=4, y2=9)
## End(No test)



