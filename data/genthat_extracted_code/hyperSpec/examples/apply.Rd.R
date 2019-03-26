library(hyperSpec)


### Name: apply
### Title: apply Computes summary statistics for the spectra of a
###   'hyperSpec' object.
### Aliases: apply apply,hyperSpec-method
### Keywords: iteration methods

### ** Examples



plotspc (apply (chondro, 2, range))

avgflu <- apply (flu, 1, mean,
                 label.spc = expression (bar (I)),
                 new.wavelength = mean (wl (flu)))
avgflu

flu[[,,405:407]]
apply (flu, 1:2, "*", -1)[[,,405:407]]

## without MARGIN the whole matrix is handed to FUN
apply (flu [,,405:407], , print) [[]]

## whereas MARGIN = 1 : 2 leads to FUN being called for each element separately
apply (flu [,,405:407], 1 : 2, print) [[]]




