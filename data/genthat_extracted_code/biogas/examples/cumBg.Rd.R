library(biogas)


### Name: cumBg
### Title: Calculate Cumulative Biogas Production
### Aliases: cumBg
### Keywords: chron manip

### ** Examples


data("vol")
data("comp")

head(vol)
head(comp)

# Calculate cumulative production and rates from vol and comp
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, id.name = "id", time.name = "days", 
		  comp.name = "xCH4", dat.name = "vol")
head(cum.prod)

# Note warnings and related NAs in results
# Set extrap = TRUE to extrapolate xCH4 to earliest times

# Calculate cumulative production and rates from vol and comp
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, id.name = "id", time.name = "days", 
		  comp.name = "xCH4", dat.name = "vol", extrap = TRUE)
head(cum.prod)

# In this case, we can use default values for some column names, so this call is identical
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, time.name = "days", extrap = TRUE)

# Plot results
## Not run: 
##D # Not run just because it is a bit slow
##D library(ggplot2)
##D qplot(x = days, y = cvCH4, data = cum.prod, xlab = "Time (d)", 
##D       ylab = "Cumulative methane production (mL)",color = id, geom = "line")
## End(Not run)

# Omit added time zero rows
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, time.name = "days", extrap = TRUE, 
		  showt0 = FALSE)
head(cum.prod)

## Not run: 
##D # Not run just because it is a bit slow
##D qplot(x = days, y = cvCH4, data = cum.prod, xlab = "Time (d)", 
##D       ylab = "Cumulative methane production (mL)", color = id, geom = "line")
## End(Not run)

# Previous is different from never adding them in the first place (rates not calculated for first 
# observations here)
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, time.name = "days", extrap = TRUE, 
		  addt0 = FALSE)
head(cum.prod)

## Not run: 
##D # Not run just because it is a bit slow
##D qplot(x = days, y = cvCH4, data = cum.prod, xlab = "Time (d)", 
##D       ylab = "Cumulative methane production (mL)", color = id, geom = "line")
## End(Not run)

# Can use POSIX objects for time (but cumBg cannot add t0 rows here)
class(vol$date.time)
class(comp$date.time)
cum.prod <- cumBg(vol, comp = comp, temp = 20, pres = 1, time.name = "date.time", extrap = TRUE)
head(cum.prod)

## Not run: 
##D # Not run just because it is a bit slow
##D qplot(x = date.time, y = cvCH4, data = cum.prod, xlab = "Time (d)", 
##D       ylab = "Cumulative methane production (mL)", color = id, geom = "line")
## End(Not run)

# Can leave out composition data, and then CH4 is not included in results
cum.prod <- cumBg(vol, temp = 20, pres = 1, time.name = "days")
head(cum.prod)

# Leave out pres or temp, and results are not standardised
cum.prod <- cumBg(vol, time.name = "days")
head(cum.prod)

# Example with input data frames with different column names
data("vol2")
data("comp2")

head(vol2)
head(comp2)

cum.prod <- cumBg(vol2, comp = comp2, temp = 20, pres = 1, 
                  id.name = "bottle", time.name = "days", 
		  dat.name = "meas.vol", comp.name = "CH4.conc")
head(cum.prod)
tail(cum.prod)

# Note warnings and related NAs in results
warnings()

# Set extrap = TRUE to avoid
cum.prod <- cumBg(vol2, comp = comp2, temp = 20, pres = 1, 
                  id.name = "bottle", time.name = "days", 
		  dat.name = "meas.vol", comp.name = "CH4.conc", 
                  extrap = TRUE)
head(cum.prod)

## Not run: 
##D # Not run just because it is a bit slow
##D qplot(x = days, y = cvCH4, data = cum.prod, xlab = "Time (d)", 
##D       ylab = "Cumulative methane production (mL)", 
##D       color = bottle, geom = "line")
## End(Not run)

# Mass example
data("mass")

mass

# Need to specify data type with dat.type argument (using default 
# values for id.name, dat.name, and comp.name)
cum.prod <- cumBg(mass, dat.type = "mass", comp = comp, temp = 35, 
                  pres = 1, time.name = "days")
cum.prod

# Drop time 0 rows
cum.prod <- cumBg(mass, dat.type = "mass", comp = comp, temp = 35, 
                  pres = 1, time.name = "days", showt0 = FALSE)
cum.prod

# Add initial headspace correction (alternatively, headspace could 
# be a data frame with a different volume for each reactor)
cum.prod <- cumBg(mass, dat.type = "mass", comp = comp, temp = 35, 
                  pres = 1, time.name = "days", headspace = 300, 
                  headcomp = "N2", temp.init = 20, showt0 = FALSE)
cum.prod

# Pressure example
data("strawPressure")
data("strawComp")
data("strawSetup")

cum.prod <- cumBg(strawPressure, dat.type = 'pres', 
                  comp = strawComp, temp = 35, 
                  id.name = 'bottle', time.name ='time', 
                  dat.name = 'pres', comp.name = 'xCH4',
                  pres.resid = 'pres.resid', temp.init = 20, 
                  pres.init = 101.325,
                  headspace = strawSetup, 
                  vol.hs.name = 'headspace', 
                  extrap = TRUE, 
                  unit.pres = 'kPa', pres.std = 101.325)

head(cum.prod)

# Absolute GC method (long format is the only option)

# Generate some data--two bottles with identical results
# Units for n1 and n2 are micromoles of CH4
biogas <- data.frame(id = rep(c('A', 'B'), each = 5), 
                     time.d = rep(1:5, 2), 
                     n1 = rep(c(1.1, 2.4, 3.8, 5.9, 2.3), 2), 
                     n2 = rep(c(NA, NA, NA, 1.2, NA), 2))

# Bottles were vented after the measurements on day 4
biogas

# Syringe volume is 0.25 mL
# Headspace volume is 50 mL

cp <- cumBg(biogas, id.name = 'id', time.name = 'time.d', 
            dat.name = 'n1', mol.f.name = 'n2', vol.syr= 0.25,
            headspace = 50, dat.type = 'gca')
cp

# Suppose the bottles had two difference headspace volumes
setup <- data.frame(id = c('A', 'B'), vol.hs = c(50, 60))

cp2 <- cumBg(biogas, id.name = 'id', time.name = 'time.d', 
            dat.name = 'n1', mol.f.name = 'n2', vol.syr= 0.25,
            headspace = setup, vol.hs.name = 'vol.hs', dat.type = 'gca')
cp2


# Different data structures
# Load example data
data("s3voll")
data("s3volw")
data("s3compl")
data("s3compw")
data("s3lcombo")

# wide

# Check data structure first
s3volw

s3compw

cum.prod <- cumBg(s3volw, comp = s3compw, temp = 25, pres = 1,
                  time.name = 'time.d',
                  data.struct = 'wide',
                  dat.name = 'D', comp.name = 'D',
                  extrap = TRUE)

cum.prod

# longcombo
s3lcombo

cum.prod <- cumBg(s3lcombo, temp = 25, pres = 1,
                  id.name = 'id', time.name = 'time.d',
                  data.struct = 'longcombo',
                  dat.name = 'vol.ml', comp.name = 'xCH4',
                  extrap = TRUE)

# Compare wide and longcombo to long (default)
s3voll
s3compl

cum.prod <- cumBg(s3lcombo, comp = s3compl, temp = 25, pres = 1,
                  id.name = 'id', time.name = 'time.d',
                  dat.name = 'vol.ml', comp.name = 'xCH4',
                  extrap = TRUE)

cum.prod





