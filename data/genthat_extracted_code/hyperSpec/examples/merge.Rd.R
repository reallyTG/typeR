library(hyperSpec)


### Name: merge,hyperSpec,hyperSpec-method
### Title: Merge hyperSpec objects
### Aliases: merge,hyperSpec,hyperSpec-method merge
###   merge,hyperSpec,data.frame-method merge,data.frame,hyperSpec-method
### Keywords: manip

### ** Examples


merge (chondro [1:10,, 600], chondro [5:15,, 600], by = c("x", "y"))$.
tmp <- merge (chondro [1:10,, 610], chondro [5:15,, 610],
              by = c("x", "y"), all = TRUE)
tmp$.
wl (tmp)

## remove duplicated wavelengths:
approxfun <- function (y, wl, new.wl){
  approx (wl, y, new.wl, method = "constant",
          ties = function (x) mean (x, na.rm = TRUE)
          )$y
}

merged <- merge (chondro [1:7,, 610 ~ 620], chondro [5:10,, 615 ~ 625], all = TRUE)
merged$.
merged <- apply (merged, 1, approxfun,
                 wl = wl (merged), new.wl = unique (wl (merged)),
                 new.wavelength = "new.wl")
merged$.

## merging data.frame into hyperSpec object => hyperSpec object
y <- data.frame (filename = sample (flu$filename, 4, replace = TRUE), cpred = 1:4)
y
tmp <- merge (flu, y)
tmp$..

## merging hyperSpec object into data.frame => data.frame
merge (y, flu)



