library(fdth)


### Name: plot.fdt
### Title: Plot fdt.default and fdt.multiple objects
### Aliases: plot.fdt plot.fdt.default plot.fdt.multiple
###   plot.fdt_cat.default plot.fdt_cat.multiple
### Keywords: fdt frequency distribution table plot histogram

### ** Examples

library(fdth)

#================================
# Vectors: univariated numerical
#================================
x <- rnorm(n=1e3,
           mean=5,
           sd=1)

(d <- fdt(x))

# Histograms
plot(d)  # Absolute frequency histogram

plot(d,
     main='My title')

plot(d,
     x.round=3,
     col='darkgreen')

plot(d,
     xlas=2)

plot(d,
     x.round=3,
     xlas=2,
     xlab=NULL)

plot(d, 
     v=TRUE, 
     cex=.8,
     x.round=3,
     xlas=2,
     xlab=NULL,
     col=rainbow(11))

plot(d,
     type='fh')    # Absolute frequency histogram

plot(d,
     type='rfh')   # Relative frequency histogram

plot(d,
     type='rfph')  # Relative frequency (%) histogram

plot(d,
     type='cdh')   # Cumulative density histogram

plot(d,
     type='cfh')   # Cumulative frequency histogram

plot(d,
     type='cfph')  # Cumulative frequency (%) histogram

# Poligons
plot(d,
     type='fp')    # Absolute frequency polygon

plot(d,
     type='rfp')   # Relative frequency polygon

plot(d,
     type='rfpp')  # Relative frequency (%) polygon

plot(d,
     type='cdp')   # Cumulative density polygon

plot(d,
     type='cfp')   # Cumulative frequency polygon

plot(d,
     type='cfpp')  # Cumulative frequency (%) polygon

# Density
plot(d,
     type='d')     # Density

# Theoretical curve and fdt
x <- rnorm(1e5,
           mean=5,
           sd=1)

plot(fdt(x,
         k=100), 
     type='d', 
     col=heat.colors(100))

curve(dnorm(x,
            mean=5,
            sd=1),
      col='darkgreen',
      add=TRUE,
      lwd=2)


#==================================
# Vectors: univariated categorical
#==================================
x <- sample(letters[1:5],
            1e3,
            rep=TRUE)

(dc <- fdt_cat(x))

# Barplot: the default
plot(dc)

# Barplot
plot(dc,
     type='fb')

# Polygon
plot(dc,
     type='fp')

# Dotchart
plot(dc,
     type='fd')

# Pareto chart
plot(dc,
     type='pa')

#=============================================
# Data.frames: multivariated with categorical
#=============================================
mdf <- data.frame(X1=rep(LETTERS[1:4], 25),
                  X2=as.factor(rep(1:10, 10)),
                  Y1=c(NA, NA, rnorm(96, 10, 1), NA, NA),
                  Y2=rnorm(100, 60, 4),
                  Y3=rnorm(100, 50, 4),
                  Y4=rnorm(100, 40, 4))

# Histograms
(d <- fdt(mdf))

plot(d,
     v=TRUE,
     cex=.8)

plot(d,
     col='darkgreen',
     ylim=c(0, 40))

plot(d,
     col=rainbow(8), 
     ylim=c(0, 40),
     main=LETTERS[1:4])

plot(d,
     type='fh')

plot(d,
     type='rfh')

plot(d,
     type='rfph')

plot(d,
     type='cdh')

plot(d,
     type='cfh')

plot(d,
     type='cfph')

# Poligons
plot(d,
     v=TRUE,
     type='fp')

plot(d,
     type='rfp')

plot(d,
     type='rfpp')

plot(d,
     type='cdp')

plot(d,
     type='cfp')

plot(d,
     type='cfpp') 

# Density
plot(d,
     type='d')     

levels(mdf$X1)

plot(fdt(mdf,
         k=5,
         by='X1'),
     ylim=c(0, 12))

levels(mdf$X2)

plot(fdt(mdf,
         breaks='FD', 
         by='X2'))

plot(fdt(mdf,
         k=5,
         by='X2'))  # It is difficult to compare

plot(fdt(mdf,
         k=5,
         by='X2'),
     ylim=c(0, 8))  # Easy

plot(fdt(iris,
         k=5))

plot(fdt(iris,
         k=5),
     col=rainbow(5))

plot(fdt(iris, 
         k=5,
         by='Species'),
     v=TRUE)

d <- fdt(iris,
         k=10)

plot(d)

plot(d, 
     type='d')

# Categorical data 
(dc <- fdt_cat(mdf))
plot(dc)

plot(dc,
     type='fd',
     pch=19)

#=========================
# Matrices: multivariated
#=========================
plot(fdt(state.x77))

plot(fdt(volcano))



