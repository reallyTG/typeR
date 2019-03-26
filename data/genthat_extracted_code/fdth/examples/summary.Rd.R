library(fdth)


### Name: summary.fdt
### Title: Summary methods for fdt objects
### Aliases: summary.fdt summary.fdt.default summary.fdt.multiple
###   summary.fdt_cat.default summary.fdt_cat.multiple
### Keywords: fdt frequency distribution table summary

### ** Examples

library (fdth)

#======================
# Vectors: univariated
#======================
set.seed(1)

x <- rnorm(n=1e3,
           mean=5,
           sd=1)

d <- fdt(x)

str(d)

d

summary(d)  # the same

summary(d,
        format=TRUE)      # It can not be what you want to publications!

summary(d, 
        format=TRUE,
        pattern='%.2f')   # Huumm ..., good, but ... Can it be better?

summary(d,
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

d[['table']]                        # Stores the feq. dist. table (fdt)
d[['breaks']]                       # Stores the breaks of fdt
d[['breaks']]['start']              # Stores the left value of the first class
d[['breaks']]['end']                # Stores the right value of the last class
d[['breaks']]['h']                  # Stores the class interval
as.logical(d[['breaks']]['right'])  # Stores the right option

#=============================================
# Data.frames: multivariated with categorical
#=============================================
mdf <- data.frame(X1=rep(LETTERS[1:4], 25),
                  X2=as.factor(rep(1:10, 10)),
                  Y1=c(NA, NA, rnorm(96, 10, 1), NA, NA),
                  Y2=rnorm(100, 60, 4),
                  Y3=rnorm(100, 50, 4),
                  Y4=rnorm(100, 40, 4))
                  
dcat <- fdt_cat(mdf) 

summary(dcat)                 

d <- fdt(mdf)

str(d)

summary(d)  # the same

summary(d,
        format=TRUE)

summary(d,
        format=TRUE,
        pattern='%05.2f')  # regular expression

summary(d, 
        col=c(1:2, 4, 6),
        format=TRUE,
        pattern='%05.2f')

print(d,
      col=c(1:2, 4, 6))

print(d,
      col=c(1:2, 4, 6),
      format=TRUE,
      pattern='%05.2f')

levels(mdf$X1)

summary(fdt(mdf,
            k=5,
            by='X1'))

levels(mdf$X2)

summary(fdt(mdf, 
            breaks='FD',
            by='X2'),
        round=3)

summary(fdt(mdf,
            k=5,
            by='X2'), 
        format=TRUE,
        round=3)

summary(fdt(iris,
            k=5),
        format=TRUE,
        patter='%04.2f')

levels(iris$Species)

summary(fdt(iris, 
            k=5, 
            by='Species'), 
        format=TRUE, 
        patter='%04.2f')

#=========================
# Matrices: multivariated
#=========================
summary(fdt(state.x77),
        col=c(1:2, 4, 6),
        format=TRUE)

summary(fdt(volcano,
            right=TRUE),
        col=c(1:2, 4, 6),
        round=3,
        format=TRUE,
        pattern='%05.1f')



