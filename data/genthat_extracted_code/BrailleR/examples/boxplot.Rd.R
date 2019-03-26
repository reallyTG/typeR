library(BrailleR)


### Name: boxplot
### Title: Create a standard boxplot with a few extra elements added to the
###   output object
### Aliases: boxplot

### ** Examples

x=rnorm(1000)
op = par(mfcol=c(2,1))
# the stamdard boxplot function returns
MyBoxplot=graphics::boxplot(x, main="Example boxplot (graphics package)", horizontal=TRUE)
MyBoxplot

# while this version returns
MyBoxplot=boxplot(x, main="Example boxplot (BrailleR package)", horizontal=TRUE)
MyBoxplot
par(op)

# The VI() method then uses the extra information stored
VI(MyBoxplot)



