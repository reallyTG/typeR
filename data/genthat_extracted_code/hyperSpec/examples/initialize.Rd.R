library(hyperSpec)


### Name: initialize
### Title: Creating a hyperSpec Object Like other S4 objects, a hyperSpec
###   object can be created by 'new'. The hyperSpec object is then
###   'initialize'd using the given parameters.
### Aliases: initialize initialize,hyperSpec-method create
###   create,hyperSpec-method new,hyperSpec-method new
### Keywords: datagen methods

### ** Examples


new ("hyperSpec")

spc <- matrix (rnorm (12), ncol = 4)
new ("hyperSpec", spc = spc)
new ("hyperSpec", data = data.frame (x = letters[1:3]),
     spc = spc)

colnames (spc) <- 600:603
new ("hyperSpec", spc = spc)  # wavelength taken from colnames (spc)

# given wavelengths precede over colnames of spc
new ("hyperSpec", spc = spc, wavelength = 700:703)

# specifying labels
h <- new ("hyperSpec", spc = spc, data = data.frame (pos = 1 : 3),
          label = list (spc = "I / a.u.",
                        .wavelength = expression (tilde (nu) / cm^-1),
                        pos = expression ("/" (x, mu*m)))
)

plot (h)
plotc (h, spc ~ pos)




