library(xgobi)


### Name: morsecodes
### Title: Rothkopf Morse Code Data
### Aliases: morsecodes morsecodes.col morsecodes.colors morsecodes.dist
###   morsecodes.glyphs morsecodes.linecolors morsecodes.lines
###   morsecodes.pos morsecodes.raw morsecodes.row
### Keywords: datasets

### ** Examples

data(morsecodes)
ls.str(pat="^morsecode")
morsecodes.row # remember what you learned in...
## real row names
(mc.row <- paste(morsecodes.row[,1], morsecodes.row[,2]))[1:8]

image(1:36, 1:36, morsecodes.raw, main="`morsecodes' raw confusion rates")
text(1:36,1:36, morsecodes.row[,1])

##--> help(xgvis) for running multidimensional scaling (MDS) and XGobi on these



