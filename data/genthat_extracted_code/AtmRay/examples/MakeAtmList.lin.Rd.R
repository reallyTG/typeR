library(AtmRay)


### Name: MakeAtmList.lin
### Title: Make List of Linear Atmospheres
### Aliases: MakeAtmList.lin
### Keywords: misc

### ** Examples

# make atmospheres spanning a range of base sound speeds and
# sound speed gradients
c0 = seq(330, 336, 0.1) 
gc = seq(-0.006, -0.004, 0.0005)

ATM_list = MakeAtmList.lin(c0 = c0, gc = gc)



