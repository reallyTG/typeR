library(tableplot)


### Name: tableplot
### Title: Tableplot
### Aliases: tableplot tableplot.default
### Keywords: hplot

### ** Examples

# Factor pattern matrix from Nisenbaum etal. (2004)
Nisenbaum <- matrix(c(
 93,  14, -14,  -3,
 87,  17, -13, -12,
 39, -15,  15,  29,
 25,  10,  21,  41,
 36, -10,   8,  35,
  5,  79,  -1,   0,
 10,  72, -11,  16,
  8,  80,  12,  -7,
 23,  47,   6,   8,
-28,  27,   5,  78,
  6,  33, -22,  37,
-10,  21, -10,  68,
-19,  -1,  93,  11,
-11,  -8,  86,   3,
  2,  -1,  53,   3,
 10,  27,  51, -11,
 21,  28,  50, -12,
 18,  10,  11,  23,
  0,  25,  15,  20,
 15, -24,   8,  54,
-13,  31,  14,  20), 21, 4, byrow=TRUE)
colnames(Nisenbaum) = paste("F", 1:4, sep="")

tableplot(
	values = Nisenbaum,
	cell.specs = list(list(0,"grey50",1,0,"red",1,"white","grey80",1,0.7,"black",FALSE,"black",93)),
	assign.sets = matrix(1,21,4)
	)	





