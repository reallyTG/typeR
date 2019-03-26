library(hyperSpec)


### Name: [,hyperSpec-method
### Title: Extract and Replace parts of hyperSpec objects
### Aliases: [,hyperSpec-method [ [[,hyperSpec-method [[ $,hyperSpec-method
###   $ [<- [<-,hyperSpec-method [[<- [[<-,hyperSpec-method $<-
###   $<-,hyperSpec-method
### Keywords: manip methods

### ** Examples


## index into the rows (spectra) -------------------------------------
## make some "spectra"

## numeric index
plot (flu, "spc", lines.args = list (lty = 2))
plot (flu[1:3], "spc", add = TRUE, col = "red")     # select spectra
plot (flu[-(1:3)], "spc", add = TRUE, col = "blue") # delete spectra

## logic index
plot (flu, "spc", lines.args = list (lty = 2))
index <- rnorm (6) > 0
index
plot (flu[index], "spc", add = TRUE, col = "red")   # select spectra
plot (flu[!index], "spc", add = TRUE, col = "blue") # select spectra

## index into the data columns ---------------------------------------
range (chondro[[,"x"]])
colnames (chondro[[,1]])
dim (chondro[[,c(TRUE, FALSE, FALSE)]])
chondro$x


## the shortcut functions --------------------------------------------

## extract the spectra matrix
flu[[]]

## indexing via logical matrix
summary (flu [[flu < 125]])

## indexing the spectra matrix with index matrix n by 2
ind <- matrix (c (1, 2, 4, 406, 405.5, 409), ncol = 2)
ind
flu [[ind]]

ind <- matrix (c (1, 2, 4, 4:6), ncol = 2)
ind
flu [[ind, wl.index = TRUE]]

pca <- prcomp (flu[[]])

## result is data.frame, if j is given:
result <- flu [[, 1:2, 405 ~ 410]]
result
class (result)
colnames (result)

## extract the data.frame including the spectra matrix
flu$.
dim(flu$.)
colnames (flu$.)
flu$.$spc

calibration <- lm (spc ~ c, data = flu[,,450]$.)
calibration

flu$..
colnames (flu$..)

## replacement functions
spc <- flu
spc$.
spc[, "c"] <- 16 : 11
## be careful:
plot (spc)
spc [] <- 6 : 1
spc$..
plot (spc)

spc <- flu [,, 405 ~ 410]
spc [[]]
spc [[3]] <- -spc[[3]]
spc [[]]
spc [[,,405 : 410]] <- -spc[[,,405 : 410]]
spc [[]]
spc [[,,405 ~ 410]] <- -spc[[,,405 ~ 410]]

## indexing with logical matrix
spc <- flu [,, min ~ 410]
spc < 125
spc [[spc < 125]] <- NA
spc [[]]

## indexing with n by 2 matrix
ind <- matrix (c (1, 2, 4, 406, 405.5, 409), ncol = 2)
ind
spc [[ind]] <- 3
spc [[]]

ind <- matrix (c (1, 2, 4, 4:6), ncol = 2)
ind
spc [[ind, wl.index = TRUE]] <- 9999
spc [[]]

spc$.
spc$z <- 1 : 6
spc
spc$z <- list (1 : 6, "z / a.u.") 




