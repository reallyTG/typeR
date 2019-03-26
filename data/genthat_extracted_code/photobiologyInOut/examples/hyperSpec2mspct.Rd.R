library(photobiologyInOut)


### Name: hyperSpec2mspct
### Title: Convert 'hyperSpec::hyperSpec' objects
### Aliases: hyperSpec2mspct hyperSpec2spct mspct2hyperSpec spct2hyperSpec

### ** Examples


library(hyperSpec)
data(laser)
wl(laser) <- 
list (wl = 1e7 / (1/405e-7 - wl (laser)),
      label = expression (lambda / nm))
laser.mspct <- hyperSpec2mspct(laser, "source_spct", "s.e.irrad")
class(laser.mspct)




