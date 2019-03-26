library(biogas)


### Name: summBg
### Title: Summarise and Normalise Cumulative Methane Production
### Aliases: summBg
### Keywords: univar manip chron

### ** Examples

data("vol")
data("comp") 
data("setup") 

# First need to calculate cumulative methane production data
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, 
                  time.name = "days", extrap = TRUE)

head(cum.prod)

# Cumulative methane production (default) at 30 d 
# Uses default names for some columns
summBg(vol = cum.prod, setup = setup, time.name = "days", when = 30)

# Or total cumulative biogas
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       vol.name = "cvBg", when = 30)

# Cumulative CH4 only, subtract inoculum contribution
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = 30)

# And normalise by mvs.sub column (mass of substrate VS here) (so the result is BMP)
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = 30, 
       norm.name = "mvs.sub")

# Same example, but return results for three times
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = c(10, 30, 60), 
       norm.name = "mvs.sub")

# Back to earlier example, but return all individual observations 
# (and total production and individual contributions of substrate 
# and inoculum) 
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = 30, 
       norm.name = "mvs.sub", show.obs = TRUE)

# Something different: interpolated biogas production rates
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       vol.name = "rvBg", when = 30, show.obs = TRUE)

# The when argument could also be 'meas', 'end', or '1p3d' (or related) for any of these examples 
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = "end", 
       norm.name = "mvs.sub")

summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = "meas", 
       norm.name = "mvs.sub")

summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = "1p3d", 
       norm.name = "mvs.sub")

# If you want to apply the 1% criterion but also want a single fixed time for all bottles,
# you have to use two calls
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = "1p3d", 
       norm.name = "mvs.sub")

# From the first call, the longest time is 42 days, so use when = 42
summBg(vol = cum.prod, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = 42, 
       norm.name = "mvs.sub")

# If an error is thrown because a bottle doesn't meet the 1% criterion, use 
# show.rates = TRUE to see rates
## Not run: 
##D # Will return error
##D cpshort <- cum.prod[cum.prod$days < 10, ]
##D summBg(vol = cpshort, setup = setup, time.name = "days", 
##D        inoc.name = "inoc", inoc.m.name = "minoc", when = "1p", 
##D        norm.name = "mvs.sub")
## End(Not run)

# So then use this to see which bottles are causing problems
cpshort <- cum.prod[cum.prod$days < 10, ]
summBg(vol = cpshort, setup = setup, time.name = "days", 
       inoc.name = "inoc", inoc.m.name = "minoc", when = "1p", 
       norm.name = "mvs.sub", show.rates = TRUE)


# Example with dataset with different column names
data("vol2")
data("comp2")
data("setup2")

# First need to calculate cumulative methane production data
cum.prod <- cumBg(vol2, comp = comp2, temp = 20, pres = 1, 
                  id.name = "bottle", time.name = "days", 
		  dat.name = "meas.vol", comp.name = "CH4.conc", 
                  extrap = TRUE)

head(cum.prod)

# Cumulative CH4 production at 30 d, subtract inoculum contribution 
# and normalise by sub.vs column (mass of substrate VS here) (look at setup2).
summBg(vol = cum.prod, setup = setup2, id.name = "bottle", 
       time.name = "days", descrip.name = "description", 
       inoc.name = "Inoculum", inoc.m.name = "inoc.mass", 
       norm.name = "sub.vs", when = 30)




