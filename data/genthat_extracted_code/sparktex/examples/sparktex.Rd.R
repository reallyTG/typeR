library(sparktex)


### Name: sparktex
### Title: Generate sparktex output
### Aliases: sparktex

### ** Examples

# Output from all examples included in `sparktex-examples.pdf`

# data for sparklines
vals <- sin(seq(1:10))

# basic sparkline
sparktex(vals)

# a wider sparkline
sparktex(vals, width=40)

# a thicker sparkline
sparktex(vals, linewidth=3)

# a sparkspike/barplot
sparktex(vals, type="sparkspike")

# constrain y to (0,1)
sparktex(vals, normalize=TRUE)

# constrain the sparkline to LaTeX line height
sparktex(vals, height=1)

# a gray background
sparktex(vals, rectangle=c(1,2))

# a colored background
sparktex(vals, rectangle=c(1,2,"rgb","0.5,0.7,0.3"))

# two colored background rectangles
sparktex(vals, rectangle=list(c(1,2,"rgb","0.5,0.7,0.3"), c(-1,0,"rgb","0.2,0.7,0.3")))

# a sparkline with start and end points
sparktex(vals, sparkdot=list(c(0.0864,sin(1),"blue"), c(0.9136,sin(10),"red")))

# a thick purple sparkline
sparktex(vals, linewidth=2, normalize=TRUE, color=c("named","purple"))



