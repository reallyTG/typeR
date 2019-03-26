library(StratigrapheR)


### Name: neatPick
### Title: Interactive user modification of the arguments of a repeated
###   function
### Aliases: neatPick

### ** Examples

# Use for stratigraphy
# You create a simple function. This one creates sinusoidal waves between
# x0 = 0 and x1 = 1. You want to personalise the amplitude (delta), the y
# offset (pos, see ?sinpoint for more details), the phase (phase, expressed
# in multiples of pi), the number of waves between x0 and x1, and the number
# of intervals between each discrete point (nint).
# So you set all these as arguments of the function. This function can also
# have a graphical output of one plot (which can be subdivided if necessary
# using par(mfrow)). And the function can return output.

fun <- function(delta = 1, pos = 1, phase = 1.5, nwave = 1, nint = 50)
{

  res <- sinpoint(1, 0, delta = delta, pos = pos, phase = phase,
                  nwave = nwave, nint = nint)

  plot(res$x,res$y)

  return(res)

}


# !!!! DEVELOPMENT COMMENT !!!! :
# I had to comment the underlying code to avoid bugs in devtools::check()



# # Once this simple function is coded, it can be integrated to neatPick(). The
# # argument n defines to number of different realisations of the function.
#
# # WHEN YOU ARE HAPPY WITH THE OUTPUTS, click on 'END & RETURN ARGUMENTS'
#
# a <- neatPick(fun, n = 10, args.only = TRUE)
#
# # If you have clicked right (on the 'END & RETURN ARGUMENTS' button), the
# # arguments will be returned and stored in a;
#
# a
#
# # These arguments can then serve for a more efficient function:
#
# seg <- sinpoint(1, 0, delta = a$delta, pos = a$pos, phase = a$phase,
#                 nwave = a$nwave, nint = a$nint)
#
# # Basically neatPick applies a for loop to fun, but if you work on a large
# # dataset, you can also create a function that can handle the arguments more
# # efficiently. This is what sinpoint does here
#
# # Now you can see the results imported in R and do whatever you want with:
#
# plot(seg$x, seg$y, type = "n")
#
# multilines(seg$i, seg$x, seg$y)
#
# # You can even rework your initial changes:
#
# b <- neatPick(fun, n = 10, args.only = TRUE, args = a)





