library(epiDisplay)


### Name: dotplot
### Title: Dot plot
### Aliases: dotplot
### Keywords: aplot

### ** Examples

a <- rep(1:2, 250)
b <- rnorm(500,mean=a)
dotplot(b)
dotplot(b, pch=1)
dotplot(b, by=a)
dotplot(b, by=a, pch=1) # You may try other values of 'pch'

# For the commands below,
# if dates in X axis are not readable, 
# try omitting '#' from the next line
# Sys.setlocale("LC_ALL", "C")

# The number of dots in each column is the frequency
# of 'x' for the exact value on the X axis.
data(Outbreak)
.data <- Outbreak
attach(.data)
class(age) # numeric
dotplot(age) # 40 columns
age.as.integer <- as.integer(age)
dotplot(age.as.integer)
# 'bin' is the number of columns in the data range.
# Specifying 'min' and 'max' only expands or truncates
# the range of the X axis and has no effect on the distribution
# of the dots inside the data range.
dotplot(age.as.integer, xmin=0, xmax=150) # Just for demonstration.
dotplot(age.as.integer, xmin=0, xmax=70) # the "99"s are now out of the plot.
dotplot(age.as.integer, xmin=0, xmax=70, by=sex)

# Controlling colours of the dots
dotplot(age.as.integer, xmin=0, xmax=70, dot.col="chocolate") 
sex1 <- factor(sex); levels(sex1) <- list("M"=1,"F"=0)
dotplot(age.as.integer, xmin=0, xmax=70, by=sex1, dot.col=c(2,5)) 
dotplot(age.as.integer, xmin=0, xmax=70, by=sex1, 
  dot.col=c("brown","blue"), main="Age by sex",
  cex.X.axis=1.3, cex.Y.axis=1.5, cex.main=1.5) 
rm(list=ls())
detach(.data)



