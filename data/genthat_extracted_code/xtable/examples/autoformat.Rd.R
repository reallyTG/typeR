library(xtable)


### Name: autoformat
### Title: Automatically Format Export Tables
### Aliases: autoformat xalign xdigits xdisplay
### Keywords: array print

### ** Examples

## 1  Vector
xalign(precip)
xdigits(precip)
xdisplay(precip)


## 2  Data frame
head(mtcars)
xdigits(mtcars, pad = FALSE)
xdigits(mtcars, pad = TRUE)
xalign(mtcars)
xdisplay(mtcars)


## 3  Autoformat when xtable is created
xtable(mtcars, align = xalign(mtcars), digits = xdigits(mtcars),
       display = xdisplay(mtcars))

## equivalent shortcut
xtable(mtcars, auto = TRUE)


## 4  Autoformat existing xtable
mt <- xtable(mtcars)
align(mt) <- xalign(mt)
digits(mt) <- xdigits(mt)
display(mt) <- xdisplay(mt)

## equivalent shortcut
mt <- autoformat(mt)



