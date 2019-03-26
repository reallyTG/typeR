library(seas)


### Name: change
### Title: Find seasonal and annual changes between two data sets
### Aliases: change
### Keywords: utilities datagen

### ** Examples

data(mscdata)
dat1 <- mksub(mscdata, id=1108447, start=1975, end=1984)
dat2 <- mksub(mscdata, id=1108447, start=1985, end=1995)

# A few plot functions to make thing easy
plot.ch <- function(x, main, h, col) {
  main <- paste(main, "between 1975-1984 and 1985-1994", sep="\n")
  barplot(x, main=main)
  abline(h=c(0, h), col=c(1, col), lty=c(1, 2))
}
plot.abs <- function(x, col="red", abs="abs", ann.abs="ann.abs") {
  main <- sprintf("Absolute change in %s", x$long.name[[1]])
  plot.ch(x[[abs]], main, x[[ann.abs]], col)
}
plot.rel <- function(x, col="orange", rel="rel", ann.rel="ann.rel") {
  main <- sprintf("Relative change in %s", x$long.name[[1]])
  plot.ch(x[[rel]], main, x[[ann.rel]], col)
}
plot.std <- function(x, col="purple") {
  main <- sprintf("Relative change in the\nstandard deviation of %s",
                  x$long.name[[1]])
  plot.ch(x$sprd.rel, main, x$ann.sprd.rel, col)
}

# Minimum temperature
ch <- change(dat1, dat2, "t_min")
str(ch)
plot.abs(ch)
plot.std(ch)
# Cannot do ch$rel ; since div/0!

# Precipitation
ch2 <- change(dat1, dat2, "precip", width="DJF", disc=TRUE)
plot.abs(ch2, "blue")
plot.rel(ch2, "purple")
plot.std(ch2)




