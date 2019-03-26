library(fdth)


### Name: fdth-package
### Title: Frequency distribution tables, histograms and polygons
### Aliases: fdth fdth-package
### Keywords: fdt frequency distribution table histogram

### ** Examples

library (fdth)

#======================
# Vectors: univariated
#======================
x <- rnorm(n=1e3,
           mean=5,
           sd=1)

(tb <- fdt(x))

# Histograms
plot(tb)  # Absolute frequency histogram

plot(tb,
     main='My title')

plot(tb,
     x.round=3,
     col='darkgreen')

plot(tb,
     xlas=2)

plot(tb,
     x.round=3,
     xlas=2,
     xlab=NULL)

plot(tb,
     v=TRUE,
     cex=.8,
     x.round=3,
     xlas=2,
     xlab=NULL,
     col=rainbow(11))

plot(tb,
     type='fh')    # Absolute frequency histogram

plot(tb,
     type='rfh')   # Relative frequency histogram

plot(tb,
     type='rfph')  # Relative frequency (%) histogram

plot(tb,
     type='cdh')   # Cumulative density histogram

plot(tb,
     type='cfh')   # Cumulative frequency histogram

plot(tb,
     type='cfph')  # Cumulative frequency (%) histogram

# Polygons
plot(tb,
     type='fp')    # Absolute frequency polygon

plot(tb,
     type='rfp')   # Relative frequency polygon

plot(tb,
     type='rfpp')  # Relative frequency (%) polygon

plot(tb,
     type='cdp')   # Cumulative density polygon

plot(tb,
     type='cfp')   # Cumulative frequency polygon

plot(tb,
     type='cfpp')  # Cumulative frequency (%) polygon

# Density
plot(tb,
     type='d')     # Density

# Summary
tb

summary(tb)  # the same

print(tb)    # the same

show(tb)     # the same

summary(tb,
        format=TRUE)      # It can not be what you want to publications!

summary(tb,
        format=TRUE,
        pattern='%.2f')   # Huumm ..., good, but ... Can it be better?

summary(tb,
        col=c(1:2, 4, 6),
        format=TRUE,
        pattern='%.2f')   # Yes, it can!

range(x)                  # To know x

summary(fdt(x,
            start=1, 
            end=9,
            h=1),
        col=c(1:2, 4, 6),
        format=TRUE,
        pattern='%d')     # Is it nice now?

# The fdt.object
tb[['table']]                        # Stores the feq. dist. table (fdt)
tb[['breaks']]                       # Stores the breaks of fdt
tb[['breaks']]['start']              # Stores the left value of the first class
tb[['breaks']]['end']                # Stores the right value of the last class
tb[['breaks']]['h']                  # Stores the class interval
as.logical(tb[['breaks']]['right'])  # Stores the right option

# Theoretical curve and fdt
y <- rnorm(1e5,
           mean=5, 
           sd=1)

tb <- fdt(y,
          k=100)

plot(tb,
     type='d',                       # density
     col=heat.colors(100))

curve(dnorm(x,
            mean=5, 
            sd=1),
      n=1e3,      
      add=TRUE, 
      lwd=4)

#=============================================
# Data.frames: multivariated with categorical
#=============================================
mdf <- data.frame(X1=rep(LETTERS[1:4], 25),
                  X2=as.factor(rep(1:10, 10)),
                  Y1=c(NA, NA, rnorm(96, 10, 1), NA, NA),
                  Y2=rnorm(100, 60, 4),
                  Y3=rnorm(100, 50, 4),
                  Y4=rnorm(100, 40, 4))

(tb <- fdt(mdf))

# Histograms
plot(tb,
     v=TRUE)

plot(tb,
     col=rainbow(8))

plot(tb,
     type='fh')

plot(tb,
     type='rfh')

plot(tb,
     type='rfph')

plot(tb, 
     type='cdh')

plot(tb,
     type='cfh')

plot(tb,
     type='cfph')

# Poligons
plot(tb,
     v=TRUE,
     type='fp')

plot(tb,
     type='rfp')

plot(tb,
     type='rfpp')

plot(tb,
     type='cdp')

plot(tb,
     type='cfp')

plot(tb,
     type='cfpp') 

# Density
plot(tb,
     type='d') 

# Summary
tb

summary(tb)  # the same

print(tb)    # the same

show(tb)     # the same

summary(tb,
        format=TRUE)

summary(tb,
        format=TRUE, 
        pattern='%05.2f')  # regular expression

summary(tb,
        col=c(1:2, 4, 6), 
        format=TRUE,
        pattern='%05.2f')

print(tb,
      col=c(1:2, 4, 6))

print(tb,
      col=c(1:2, 4, 6), 
      format=TRUE,
      pattern='%05.2f')

# Using by
levels(mdf$X1)

plot(fdt(mdf,
         k=5,
         by='X1'),
     col=rainbow(5))

levels(mdf$X2)

summary(fdt(iris,
            k=5),
        format=TRUE,
        patter='%04.2f')

plot(fdt(iris,
         k=5),
     col=rainbow(5))

levels(iris$Species)

summary(fdt(iris,
            k=5,
            by='Species'),
        format=TRUE,
        patter='%04.2f')

plot(fdt(iris,
         k=5,
         by='Species'),
     v=TRUE)

#=========================
# Matrices: multivariated
#=========================
summary(fdt(state.x77),
        col=c(1:2, 4, 6),
        format=TRUE)

plot(fdt(state.x77))

# Very big
summary(fdt(volcano,
            right=TRUE),
        col=c(1:2, 4, 6),
        round=3,
        format=TRUE,
        pattern='%05.1f')

plot(fdt(volcano,
         right=TRUE))



