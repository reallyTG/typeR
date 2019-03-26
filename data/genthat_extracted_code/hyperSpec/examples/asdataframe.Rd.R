library(hyperSpec)


### Name: as.data.frame
### Title: Conversion of a hyperSpec object into a data.frame or matrix
###   'as.data.frame' returns 'x@data' (as data.frame) 'as.matrix' returns
###   the spectra matrix 'x@data$spc' as matrix
### Aliases: as.data.frame as.data.frame.hyperSpec
###   as.data.frame,hyperSpec-method as.matrix.hyperSpec as.matrix
###   as.matrix,hyperSpec-method as.wide.df as.long.df as.t.df
### Keywords: methods

### ** Examples


as.data.frame (chondro [1:3,, 600 ~ 620])
as.matrix (chondro [1:3,, 600 ~ 620])
lm (c ~ spc, data = flu [,,450])

as.wide.df (chondro [1:5,, 600 ~ 610])
summary (as.wide.df (chondro [1:5,, 600 ~ 610]))

as.long.df (flu [,, 405 ~ 410])
summary (as.long.df (flu [,, 405 ~ 410]))
summary (as.long.df (flu [,, 405 ~ 410], rownames = TRUE))
summary (as.long.df (flu [,, 405 ~ 410], wl.factor = TRUE))

df <- as.t.df (apply (chondro, 2, mean_pm_sd))
head (df)

if (require (ggplot2)){
  ggplot (df, aes (x = .wavelength)) +
    geom_ribbon (aes (ymin = mean.minus.sd, ymax = mean.plus.sd),
      fill = "#00000040") +
    geom_line (aes (y = mean))
}



