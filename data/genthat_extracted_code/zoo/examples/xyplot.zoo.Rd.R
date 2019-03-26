library(zoo)


### Name: xyplot.zoo
### Title: Plot zoo Series with Lattice
### Aliases: xyplot.zoo xyplot.its xyplot.tis llines.zoo llines.its
###   llines.tis lpoints.zoo lpoints.its lpoints.tis ltext.zoo ltext.its
###   ltext.tis panel.lines.zoo panel.lines.ts panel.lines.its
###   panel.lines.tis panel.points.zoo panel.points.ts panel.points.its
###   panel.points.tis panel.text.zoo panel.text.ts panel.text.its
###   panel.text.tis panel.plot.default panel.plot.custom
###   panel.segments.zoo panel.segments.ts panel.segments.its
###   panel.segments.tis panel.rect.zoo panel.rect.ts panel.rect.its
###   panel.rect.tis panel.polygon.zoo panel.polygon.ts panel.polygon.its
###   panel.polygon.tis
### Keywords: hplot ts

### ** Examples

if(require("lattice") & require("grid")) {

set.seed(1)
z <- zoo(cbind(a = 1:5, b = 11:15, c = 21:25) + rnorm(5))

# plot z using same Y axis on all plots
xyplot(z, scales = list(y = list(relation = "same", alternating = FALSE)))
 
# plot a double-line-width running mean on the panel of b.
# Also add a grid.
# We show two ways to do it. 

# change strip background to levels of grey
# If you like the defaults, this can be omitted.
strip.background <- trellis.par.get("strip.background")
trellis.par.set(strip.background = list(col = grey(7:1/8)))


# Number 1.  Using trellis.focus.
print( xyplot(z) )
trellis.focus("panel", 1, 2, highlight = FALSE)
# (or just trellis.focus() for interactive use)
z.mean <- rollmean(z, 3)
panel.lines(z.mean[,2], lwd = 2)
panel.grid(h = 10, v = 10, col = "grey", lty = 3)
trellis.unfocus()

# Number 2. Using a custom panel routine.
xyplot(z, panel = function(x, y, ...) {
    if (packet.number() == 2) {
        panel.grid(h = 10, v = 10, col = "grey", lty = 3)
        panel.lines(rollmean(zoo(y, x), 3), lwd = 2)
    }
    panel.xyplot(x, y, ...)
})

# plot a light grey rectangle "behind" panel b
trellis.focus("panel", 1, 2)
grid.rect(x = 2, w = 1, default.units = "native", 
  gp = gpar(fill = "light grey"))
# do.call("panel.xyplot", trellis.panelArgs())
do.call("panel.lines", trellis.panelArgs()[1:2])
trellis.unfocus()
# a better method is to use a custom panel function.
# see also panel.xblocks() and layer() in the latticeExtra package.

# same but make first panel twice as large as others
lopt <- list(layout.heights = list(panel = list(x = c(2,1,1))))
xyplot(z, lattice.options = lopt)
# add a grid
update(trellis.last.object(), type = c("l", "g"))

# Plot all in one panel.
xyplot(z, screens = 1)
# Same with default styles and auto.key:
xyplot(z, superpose = TRUE)

# Plot first two columns in first panel and third column in second panel.
# Plot first series using points, second series using lines and third
#  series via overprinting both lines and points
# Use colors 1, 2 and 3 for the three series (1=black, 2=red, 3=green)
# Make 2nd (lower) panel 3x the height of the 1st (upper) panel
# Also make the strip background orange.
p <- xyplot(z, screens = c(1,1,2), type = c("p", "l", "o"), col = 1:3,
  par.settings = list(strip.background = list(col = "orange")))
print(p, panel.height = list(y = c(1, 3), units = "null"))

# Example of using a custom axis
# Months are labelled with smaller ticks for weeks and even smaller
# ticks for days.
Days <- seq(from = as.Date("2006-1-1"), to = as.Date("2006-8-8"), by = "day")
z1 <- zoo(seq(length(Days))^2, Days)
Months <- Days[format(Days, "%d") == "01"]
Weeks <- Days[format(Days, "%w") == "0"]
print( xyplot(z1, scales = list(x = list(at = Months))) )
trellis.focus("panel", 1, 1, clip.off = TRUE)
panel.axis("bottom", check.overlap = TRUE, outside = TRUE, labels = FALSE, 
  tck = .7, at = as.numeric(Weeks))
panel.axis("bottom", check.overlap = TRUE, outside = TRUE, labels = FALSE, 
  tck = .4, at = as.numeric(Days))
trellis.unfocus()

trellis.par.set(strip.background = strip.background)

# separate the panels and suppress the ticks on very top
xyplot(z, between = list(y = 1), scales = list(tck = c(1,0)))

# left strips but no top strips
xyplot(z, screens = colnames(z), strip = FALSE, strip.left = TRUE)

# plot list of zoo objects using different x scales
z.l <- list(
	zoo(cbind(a = rnorm(10), b = rnorm(10)), as.Date("2006-01-01") + 0:9),
	zoo(cbind(c = rnorm(10), d = rnorm(10)), as.Date("2006-12-01") + 0:9)
)
zm <- do.call(merge, z.l)
xlim <- lapply(zm, function(x) range(time(na.omit(x))))
xyplot(zm, xlim = xlim, scale = list(relation = "free"))
# to avoid merging see xyplot.list() in the latticeExtra package.

}

## Not run: 
##D ## playwith (>= 0.9)
##D library("playwith")
##D 
##D z3 <- zoo(cbind(a = rnorm(100), b = rnorm(100) + 1), as.Date(1:100))
##D playwith(xyplot(z3), time.mode = TRUE)
##D # hold down Shift key and drag to zoom in to a time period.
##D # then use the horizontal scroll bar.
##D 
##D # set custom labels; right click on points to view or add labels
##D labs <- paste(round(z3,1), index(z3), sep = "@")
##D trellis.par.set(user.text = list(cex = 0.7))
##D playwith(xyplot(z3, type = "o"), labels = labs)
##D 
##D # this returns indexes into times of clicked points 
##D ids <- playGetIDs()
##D z3[ids,]
##D 
##D ## another example of using playwith with zoo
##D # set up data
##D dat <- zoo(matrix(rnorm(100*100),ncol=100), Sys.Date()+1:100)
##D colnames(dat) <- paste("Series", 1:100)
##D 
##D # This will give you a spin button to choose the column to plot,
##D # and a button to print out the current series number.
##D playwith(xyplot(dat[,c(1,i)]),  parameters = list(i = 1:100,
##D    do_something = function(playState) print(playState$env$i))
##D 
## End(Not run)




