library(StratigrapheR)


### Name: StratigrapheR
### Title: StratigrapheR: integrated stratigraphy for R
### Aliases: StratigrapheR

### ** Examples

# This is an example of litholog generation script, along with some
# explanations: if you want to start somewhere, start here. You may run the
# whole thing and follow the explanations.

library(StratigrapheR)
library(dplyr) # very useful package, used here for joining data frames

# You may want to change your working directory for this, the example will
# generate .pdf and .txt files;
# setwd()

# If you want to have an organisational chart of the functions:
pdfDisplay(StratigrapheR(), 9, 7.5, "Organisational Chart StratigrapheR",
           openfile = TRUE)

# Bed dataset ----

bed.example

# this dataset should include the description of each bed with :
# - l - the position of the base of each bed (in cm or m) - l stands for the
#   left side or boundary of an interval-
# - r - the position of the top of each bed (in cm or m) - r stands for the
#   right side or boundary of an interval-
# - litho - the lithology, basics are for instance C for chert, S for shale, L
#   for limestone... but you can include anything you want in any way you want
# - h - relief or hardness of each bed
# - id - is the bed identification, number (e.g. B1, B2, ...)
#   you can also include other columns with anything else you find useful for
#   each bed such as color or lithofacies



# Ponctual elements datasets ----

fossil.example
boundary.example
chron.example

# These dataset(s) should include any ponctual information you want in the log,
# such as the position of particular fossils, bioturbations, minerals, tectonic
# features, etc...

# We will also see how to add proxy information with:

proxy.example



# Work the datasets ----

# Basic litholog (rectangles) --
# it will take the basic data (l, r, h, id)

basic.log <- litholog(l = bed.example$l, r = bed.example$r,
                      h = bed.example$h, i = bed.example$id)

# Define the legend for each lithology ----
# for each lithology you can provide a color (col), a density of shading
# (density) and orientation for the lines (angle)

legend <- data.frame(litho = c("S", "L", "C"),
                     col = c("grey30", "grey90", "white"),
                     density = c(30, 0,10),
                     angle = c(180, 0, 45), stringsAsFactors = FALSE)

bed.legend <- left_join(bed.example,legend, by = "litho")



# Plot a basic litholog ----

# Be warned that the most efficient way to generate a litholog is to put it
# in a function. We will see this lower in the exaplanation. The three first
# lithologs generated in the R plot window are simply an example to help you
# understand the functions in StratigrapheR

# First prepare the plot using whiteSet(): this provides a clean drawing area

whiteSet(xlim = c(0,10), ylim = c(-1,77), ytick = 5, ny = 5) # Prepare plot
title("Using litholog() and bedtext()")

# Then add the polygons making the litholog. This is done with a single function
# identifying each polygon by the id of points. The graphical parameters of the
# polygons can be adapted to fit the legend, polygon by polygon.

multigons(basic.log$i, x = basic.log$xy, y = basic.log$dt,
          col = bed.legend$col,
          density = bed.legend$density,
          angle = bed.legend$angle)

# You can further add the name of each bed on each corresponding polygon

bedtext(labels = bed.example$id, l = bed.example$l, r = bed.example$r,
        x = 0.5,  # x position where to centre the text
        ymin = 3) # ymin defines the minimum thickness for the beds where text
                  # will be added, making for a clean litholog



# Vectorised drawing: example of importation ----

# This creates a svg in one of your temporary files, to show how to import svg
# files
svg.file.directory <- tempfile(fileext = ".svg")
writeLines(example.ammonite.svg, svg.file.directory)
print(paste("An example .svg file was created at ", svg.file.directory,
            sep = ""))

# The pointsvg function allows to import simple svg drawings into R
ammonite.drawing <- pointsvg(file = svg.file.directory)

# If you want to import your own .svg file uncomment the following line:
# pointsvg(file.choose())

# Other data frames of vectorised drawings are imbedded into the
# StratigrapheR package for this example : example.ammonite.svg (to see how to
# use pointsvg), example.ammonite, example.belemnite and example.liquefaction

# Now that ammonite.drawing is available, lets see what it looks like

whiteSet(ylim = c(-1,1), xlim = c(-1,1)) # Plot
box()

title("ammonite.drawing")

placesvg(ammonite.drawing)

# The placesvg() function plots any pointsvg-like dataset, which is a data frame
# with a column x, y, id (for each polygon or polyline) and type (polygone or
# line). Note that only polygons and polylines drawings can be imported by
# pointsvg()

# You can see that the ammonite drawing is centred on 0,0, and has its maxima
# and minima at 1 and -1 respectively, for x and y alike. To plot a drawing
# at the right position and ratio, you can use the centresvg and framesvg
# functions

# For that you have to provide information about the position, for instance:

y.ammonite <- fossil.example$dt[fossil.example$type == "ammonite"]
y.ammonite

# y.ammonite is the y position (or depth) where each ammonite should be drawn.
# It is provided via a vector of any length (i.e. you can have any number of y
# positions and of corresponding ammonites), as long as all the other parameters
# are of length 1 or of same length (i.e. you could provide two values for x if
# you want the two ammonite drawings to have a different x position)

# First build the log

whiteSet(xlim = c(0,10), ylim = c(-1,77), ytick = 5, ny = 5)
title("Using pointsvg() and centresvg()")

multigons(basic.log$i, x = basic.log$xy, y = basic.log$dt,
          col = bed.legend$col,
          density = bed.legend$density,
          angle = bed.legend$angle)

bedtext(labels = bed.example$id, l = bed.example$l, r = bed.example$r,
        x = 0.5,  ymin = 3)

# Then add the drawings

centresvg(ammonite.drawing,
          x = 7, # this is an arbitrary x position for each ammonite drawing
          y = y.ammonite,
          xfac = 0.75,   # Correction factor for the ratio in x
          yfac = c(3,5)) # Correction factor for the ratio in y. As the other
                         # parameters it can be adapted for each drawing
                         # individually

# The centresvg() function will take a data frame outputted by pointsvg() - or
# from changesvg(), and even centresvg() and framesvg() if the output is TRUE as
# these two functions can output drawings with modified coordinates -.



# Dealing with bed thickness changes ----

# You can also weld changes of bed thickness at bed boundaries to the basic log

# For instance we can define here two types of sinuosidal boundaries. If you
# want you can even design a different type of 'wiggle' for each boundary.

s1 <- sinpoint(5,0,0.5,nwave = 1.5)
s2 <- sinpoint(5,0,1,nwave = 3, phase = 0)

# You can also weld lines you have drawn in svg and imported with pointsvg().
# However there are a few rules to use them as boundaries in StratigrapheR:
# you have to think about their coordinates. The function welding the 'wiggles'
# of the boundaries to the rectangles of the log, weldlog(), will require to set
# what you consider to be the beginning of the wiggle (at the left of the
# litholog) at 0,0 (if you run with the default parameters of weldlog, which is
# advised if you start), and define their coordinates to suit the scale of the
# litholog

# You can use centresvg() or framesvg() to change the coordinates, setting the
# output argument to TRUE (and the plot argument to FALSE if you don't want to
# plot)

s3 <- framesvg(example.liquefaction, 1, 4, 0, 2, plot = FALSE, output = TRUE)

# In framesvg(), rather than providing the point to center the drawing on, and
# correction in x and y (as centresvg does), you provide the maxima and minima
# in x and y

# With the function wedlog, we combine the lithological log we created
# (basic.log) with the wavy bed boundaries we created. We provide the log
# -parameter log-, the position of the joints we would lie to change -dt-, the
# segments that are going to be welded to the basic log -seg, as a list of
# data frames, by default having the first column for the xy coordinates and
# second for dt coordinates- and j making the link between the boundaries
# position -dt- and the segments -seg-.

# For each j corresponds a respective dt of same index (for each dt corresponds
# a j at the same position), and each j refers to the index or the name of a
# segment in the list of segments.

# with the function wedlog, we combine the lithological log we created
# (basic.log) with the wavy bed boundaries we created. So you can use any
# wiggle you define on your own and weld it to the log

final.log <- weldlog(log = basic.log, dt = boundary.example$dt,
                     seg = list(s1 = s1, s2 = s2, s3 = s3),
                     j = c("s1","s1","s1","s3","s2","s2","s1"))

# Lets see the result of the welding

whiteSet(xlim = c(-3,8), ylim = c(-1,77), ytick = 5, ny = 5) # Prepare plot

# This plot is going to serve to explain other functions;
title("Using weldlog(), infobar(), simp.lim() and minorAxis()")


multigons(final.log$i, x = final.log$xy, y = final.log$dt,
          col = bed.legend$col,
          density = bed.legend$density,
          angle = bed.legend$angle)

bedtext(labels = bed.example$id, l = bed.example$l, r = bed.example$r,
        x = 0.5, ymin = 3)



# Defining and drawing specific intervals  ----

# Lets say we would like to plot the position of magnetochrons. For that we
# firstly define a legend for each type of interval, here for normal and reverse
# polarity

legend.chron <- data.frame(polarity = c("N", "R"),
                           bg.col = c("black", "white"),
                           text.col = c("white", "black"),
                           stringsAsFactors = FALSE)

# Then we set the legend for each chron
chron.legend <- left_join(chron.example,legend.chron, by = "polarity")

# There are three chrons, but what we did can be applied to any number of them,
# as long as they are identified by a column (or more, left_join can merge using
# more than one column)

# Using this legend we can draw rectangles with text in it using the infobar()
# function. In this function we define the coordinates of each rectangle
# (linked to dt for y, and different for each rectangle, but constant in x)
# the text to be in the rectangles with the labels parameter, and graphical
# parameters to be used by the multigons() and text() functions embedded in the
# infobar() function. The number of rectangles is n, and the length of the y, x,
# and labels elements can be 1 or n (i.e. the same n for each parameter).

# You can provide a list of graphical parameters such as the colour for the
# rectangles and the text, as long as the length of each parameter
# in that list is 1 or n.

# Notice that this function shares has a lot in common with litholog() and
# multigons() in functionality and arguments. Note that you could obtain a
# similar result using litholog(), multigons() and bedtext(). You would simply
# need to code more :-)

infobar(-2.5, -2, chron.legend$l, chron.legend$r,
        labels = chron.legend$polarity,
        m = list(col = chron.legend$bg.col),
        t = list(col = chron.legend$text.col),
        srt = 0)



# Treat data sets made of intervals (as happens a lot in geology) ----

# As you have seen with litholog, intervals are dealt with by defining lim
# objects having a left and right boundary (l and r), an id and a boundary rule.
# Whichever of l and r is the maxima or minima usually does not
# matter. StratigrapheR offers a few functions to treat lim objectss. Here
#  we will see the simp.lim() function, but if you want more info go see the
# ?as.lim help page, and the functions in its See Also part.

# simp.lim: this functions merges intervals of same id (if adjacent or
# overlapping)

# Basically, the lim objects are boundaries, for instance in the form [0,1[
# which would indicate an interval going from 0 to 1, zero included but 1 not.
# simp.lim takes the left and right boundaries, assumes that each boundary
# is included in the interval (by default b = "[]"), and simplifies the interval
# by merging them by id, which gives the litholical information in merged
# rectangles (with S, C and L indicating shales, cherts and limestones in this
# case).

litho.intervals <- simp.lim(l = bed.legend$l, r = bed.legend$r,
                     id = bed.legend$litho)

# The resulting list needs to be transformed into a data frame to merge with the
# legend.

litho.intervals <- data.frame(litho.intervals, stringsAsFactors = FALSE)

# Note the parameter stringsAsFactors that is set to FALSE, which is usually
# required when you create data frames to avoid problems, for instance using
# left_join()

colnames(litho.intervals)[3] <- "litho" # Change a column name to be able to merge
                                 # legend and data

litho.intervals.legend <- left_join(litho.intervals,legend, by = "litho")

infobar(-1.25, -0.75, litho.intervals.legend$l, litho.intervals.legend$r,
        m = list(col = litho.intervals.legend$col,
                 density = litho.intervals.legend$density,
                 angle = litho.intervals.legend$angle))

# As you can see if you look closely at the "Using weldlog(), infobar() and
# simp.lim()" plot, the subdivisions between beds of same lithology is gone.
# This is the result of the simp.lim() function by interval manipulation



# Add sample position with axis ----

# If you want you can also show where every sample is using the minorAxis()
# function, which allows disticntion between major and minor ticks

at.min <- every_nth(proxy.example$dt, 5, empty = FALSE)
at.maj <- every_nth(proxy.example$dt, 5, inverse = TRUE, empty = FALSE)
labels.maj <- every_nth(proxy.example$name, 5, inverse = TRUE, empty = FALSE)

# The every_nth function allows here to skip samples regularly (to avoid having
# too much text)

minorAxis(side = 4,                # Right-sided axis
          at.min = at.min,         # dt/y position of minor ticks
          at.maj = at.maj,         # dt/y position of major ticks
          labels.maj = labels.maj, # Text to add at major ticks
          tick.ratio = 0.5,        # Length ratio between minor and major ticks
          pos = 6,                 # x position
          las = 1,                 # Orientation of text
          lwd = 0 ,                # Width of axis line to 0 removes the line
          lwd.ticks = 1)           # Width of axis ticks to 1 to keep the ticks




# Final litholog generation: getting it in a convenient function ----

# Once the final design for the lithology is established, it can be integrated
# into a graphical function which will draw every component of the final
# litholog with each desired feature.

# The most efficient way to generate the litholog is to directly put it in a
# reusable function so that you do not do all the work twice. However you need
# some of the data sets we've prepared, in this case bed.example,
# fossil.example, boundary.example, chron.example (that are already imbedded
# in StratigrapheR), final.log, bed.legend, chron.legend and litholeg (that
# are created in this script)

# If you do not want to run all unnecessary functions whenever you want to draw
# your log, a good trick is to save all the necessary data.frames needed in
# the litholog drawing function (here one.log) and load them in it. You just
# need to have the saving file (here one.log.txt) in your working directory (see
# ?setwd and ?getwd help pages for further help on that)

save(final.log, bed.legend, chron.legend, litho.intervals.legend,
     file = "one.log.txt")

one.log <- function(xlim = c(-2.5,7), ylim = c(-1,77),
                    xarg = NULL,  # this is transmitted to whiteSet: if set to
                                  # NULL its allows to avoid drawing the x axis
                    yarg = list(tick.ratio = 0.5, las = 1),
                    main = "Final litholog")
{
  load("one.log.txt") # Load the saved data frames

  whiteSet(xlim = xlim, ylim = ylim, ytick = 5, ny = 5,
           xarg = xarg, yarg = yarg)

  title(main = main)

  multigons(final.log$i, x = final.log$xy, y = final.log$dt,
            col = bed.legend$col,
            density = bed.legend$density,
            angle = bed.legend$angle)

  bedtext(labels = bed.example$id, l = bed.example$l, r = bed.example$r,
          x = 0.5, edge = TRUE)

  centresvg(example.ammonite, 6,
            fossil.example$dt[fossil.example$type == "ammonite"],
            xfac = 0.5)

  centresvg(example.belemnite, 6,
            fossil.example$dt[fossil.example$type == "belemnite"],
            xfac = 0.5)

  infobar(-2, -1.5, chron.legend$l, chron.legend$r,
          labels = chron.legend$id,
          m = list(col = chron.legend$bg.col),
          t = list(col = chron.legend$text.col))

  infobar(-1, -0.5, litho.intervals.legend$l, litho.intervals.legend$r,
          labels = litho.intervals.legend$litho, srt = 0)
}

# This graphical function can then be used as a standalone function, or
# integrated in a for loop to draw the entirety in a succesion of panels
# (typically in pdf form)

# Indeed, if you go back to the definition of the one.log() function, you can
# see that we gave it a parameter, ylim. That parameter defines the range of dt
# that is covered in the plot. So you can plot a smaller part of the log:

one.log(ylim = c(18,53), main = "Final litholog from dt 18 to 53")

# Or you can create a second function that creates a loop of the log if you want
# to generate an ensemble of sheets that placed end to end would create a
# complete litholog

# Basically can want to set up the scale (i.e. the y -or dt- interval of the
# litholog seen for each plot -or pdf page-: if you want to see each time an
# interval of 30 y-units of the litholog on each plot/pdf page, can set the
# parameter 'interval' of the following function to 30)

repeated.log <- function(start = 0, interval = 20)
{
  omar <- par("mar")

  par(mar = c(1,4,3,2)) # This allows to define the margins as you wish

  l1 <- seq(start,max(final.log$dt),interval)
  l2 <- seq(start,max(final.log$dt),interval) + interval

  for(i in length(l1):1)
  {
    one.log(ylim = c(l1[i],l2[i]),
            main = paste("Repeated litholog, part from dt", l1[i], "to", l2[i]))
  }

 par(mar = omar)

}

repeated.log()

# Printing and seeing you litholog in pdf ----

# The next function, pdfDisplay, generates a pdf of a graphical function.
# Any function producing plots such as repeated.log() can be inserted into it to
# generate plots. These plots will all be of the same size. I believe this
# function might not work on every computer. And its openfile argument, which
# causes the pdf to open, only works in Windows. If You are working with
# Windows, I recommend using SumatraPDF as your default pdf reader: this will
# allow pdfs to be changed while they are being visualised.

pdfDisplay(repeated.log(), width = 10, height = 15,
           name = "StratigrapheR_Example_a",
           # warn = TRUE, # Uncomment (remove the # sign) this parameter
                       # to avoid the warning
           openfile = TRUE)



# Plotting data -e.g. time-series data of a proxy - along the litholog ----

# Now lets say you want to plot information along the litholog. For that we will
# work in a graphical function that we will provide to pdfDisplay. Note that
# it is not possible to base yourself on the repeated.log() function, because
# it will print all the plots succesively without allowing modification or
# addition

# One way of working is to create two plots next to each other and provide
# identical y axis parameters

graphical.function.1 <- function()
{

  opar <- par("mar","mfrow")

  par(mar = c(3,4,3,2),
      mfrow = c(1,2)) # This creates two windows where to plot sucessively

  # Plot the litholog on the left

  one.log(main = "")

  # Plot the other data on the right

  blackSet(xlim = c(-2*10^-8,8*10^-8),
           ylim =  c(-1,77), # It is important to define identical y limits
                             # between the litholog and the proxy
           ytick = 5, ny = 1,
           targ = NULL)

  lines(proxy.example$ms, proxy.example$dt, type = "o", pch = 19)

  par(mar = opar$mar, mfrow = opar$mfrow)

}

pdfDisplay(graphical.function.1(), width = 10, height = 15,
           name = "StratigrapheR_Example_b",
           # warn = TRUE, # Uncomment (remove the # sign) this parameter
                       # to avoid the warning
           openfile = TRUE)

# If you want to put that repeated litholog in A4 format, the best way is to
# use LaTeX. The following lines of code will create a TeX file that would
# do that, test it if you want:

writeLines(log.loop.tex, paste(getwd(),"log.loop.tex", sep = "/"))

# Another way to work this out is to create more space than needed on the
# litholog plot and to add elements

graphical.function.2 <- function()
{
  omar <- par("mar")

  par(mar = c(3,4,3,2))

  # Plot the litholog with room for the rest

  one.log(main = "", xlim = c(-3,16), xarg = list())

  par(fig = c(0.5,1, 0, 1),  # 'fig' defines the overlapping plotting window
                             # dimensions x1, x2, y1 and y2
      new = TRUE)               # 'new' allows addition to a preexisting plot

  # The graphical parameter 'fig' that you can set using the par() function
  # allows you to define a new plotting region overlapping the original one.
  # This allows you to redefine x axes values. But again using this you have to
  # be careful to provide the right y limits between the litholog and the proxy.
  # Be aware that the functions white-, black- and greySet() set the xaxis and
  # yaxis to "i", which means that the limits you provide in x and y are the
  # actual limits of the plot (while the default setting of xaxis and yaxis are
  # "r", which extends the data range by 4 percent at each end)

  blackSet(xlim = c(-2*10^-8,8*10^-8),
           ylim =  c(-1,77),
           ytick = 5, ny = 1,
           targ = NULL,
           xarg = list(side = 3))

  lines(proxy.example$ms, proxy.example$dt, type = "o", pch = 19)

  par(mar = omar)

}

pdfDisplay(graphical.function.2(), width = 8, height = 15,
           name = "StratigrapheR_Example_c",
           # warn = TRUE, # Uncomment (remove the # sign) this parameter
           # to avoid the warning
           openfile = TRUE)




