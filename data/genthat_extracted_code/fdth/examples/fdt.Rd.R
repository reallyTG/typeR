library(fdth)


### Name: fdt
### Title: Frequency distribution table for numerical data
### Aliases: fdt fdt.default fdt.data.frame fdt.matrix
### Keywords: fdt fdt_cat frequency distribution table

### ** Examples

library(fdth)

##========
## Vector
##========
x <- rnorm(n=1e3,
           mean=5,
           sd=1)

# x
(fdt <- fdt(x))

# x, alternative breaks
(fdt <- fdt(x,
            breaks='Scott'))

# x, k
(fdt <- fdt(x,
            k=10))

# x, star, end
range(x)

(fdt <- fdt(x,
            start=floor(min(x)),
            end=floor(max(x) + 1)))

# x, start, end, h
(fdt <- fdt(x,
            start=floor(min(x)),
            end=floor(max(x) + 1),
            h=1))

# Effect of right
x <- rep(1:3, 3); sort(x)

(fdt <- fdt(x,
            start=1,
            end=4,
            h=1))

(fdt <- fdt(x,
            start=0,
            end=3,
            h=1,
            right=TRUE))

##================================================
## Data.frame: multivariated with two categorical
##================================================
mdf <- data.frame(c1=sample(LETTERS[1:3], 1e2, TRUE),
                  c2=as.factor(sample(1:10, 1e2, TRUE)),
                  n1=c(NA, NA, rnorm(96, 10, 1), NA, NA),
                  n2=rnorm(100, 60, 4),
                  n3=rnorm(100, 50, 4))

head(mdf)

(fdt <- fdt(mdf))

# By factor!
(fdt <- fdt(mdf,
            k=5,
            by='c1'))

# choose FD criteria               
(fdt <- fdt(mdf,
            breaks='FD',
            by='c1'))

(fdt <- fdt(mdf,
            k=5,
            by='c2'))

(fdt <- fdt(iris,
            k=10))

(fdt <- fdt(iris,
            k=5,
            by='Species'))

#=========================
# Matrices: multivariated
#=========================
(fdt <-fdt(state.x77))



