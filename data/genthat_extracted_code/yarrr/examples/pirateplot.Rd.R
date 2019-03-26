library(yarrr)


### Name: pirateplot
### Title: pirateplot
### Aliases: pirateplot
### Keywords: plot

### ** Examples



# Default pirateplot of weight by Time
pirateplot(formula = weight ~ Time,
          data = ChickWeight)

# Same but in grayscale
pirateplot(formula = weight ~ Time,
          data = ChickWeight,
          pal = "gray")


# Now using theme 2
pirateplot(formula = weight ~ Time,
          data = ChickWeight,
          main = "Chicken weight by time",
          theme = 2) # theme 2

# theme 3
pirateplot(formula = weight ~ Time,
          data = ChickWeight,
          main = "Chicken weight by time",
          theme = 3) # theme 3

# theme 4
pirateplot(formula = weight ~ Time,
          data = ChickWeight,
          main = "Chicken weight by time",
          theme = 4) # theme 4

# Start with theme 2, but then customise!
pirateplot(formula = weight ~ Time,
          data = ChickWeight,
          theme = 2, # theme 2
          pal = "xmen", # xmen palette
          main = "Chicken weights by Time",
          point.o = .4, # Add points
          point.col = "black",
          point.bg = "white",
          point.pch = 21,
          bean.f.o = .2, # Turn down bean filling
          inf.f.o = .8, # Turn up inf filling
          gl.col = "gray", # gridlines
          gl.lwd = c(.5, 0)) # turn off minor grid lines

# 2 IVs
pirateplot(formula = len ~ dose + supp,
          data = ToothGrowth,
          main = "Guinea pig tooth length by supplement",
          point.pch = 16,  # Point specifications...
          point.col = "black",
          point.o = .7,
          inf.f.o = .9, # inference band opacity
          gl.col = "gray")


# Build everything from scratch with theme 0
#  And use 3 IVs
pirateplot(formula = height ~ headband + eyepatch + sex,
          data = pirates,
          pal = gray(.1), # Dark gray palette
          theme = 0, # Start from scratch
          inf.f.o = .7, # Band opacity
          inf.f.col = piratepal("basel"), # Add color to bands
          point.o = .1, # Point opacity
          avg.line.o = .8, # Average line opacity
          gl.col = gray(.6), # Gridline specifications
          gl.lty = 1,
          gl.lwd = c(.5, 0))

  # See the vignette for more details
 vignette("pirateplot", package = "yarrr")





