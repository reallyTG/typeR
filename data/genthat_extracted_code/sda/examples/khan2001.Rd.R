library(sda)


### Name: khan2001
### Title: Childhood Cancer Study of Khan et al. (2001)
### Aliases: khan2001
### Keywords: datasets

### ** Examples

# load sda library
library("sda")

# load full Khan et al (2001) data set
data(khan2001)
dim(khan2001$x) # 88 2308
hist(khan2001$x)
khan2001$y # 5 levels

# data set containing the SRBCT samples
get.srbct = function()
{
  data(khan2001)
  idx = which( khan2001$y == "non-SRBCT" )
  x = khan2001$x[-idx,]
  y = factor(khan2001$y[-idx])
  descr = khan2001$descr[-idx]

  list(x=x, y=y, descr=descr)
}

srbct = get.srbct()
dim(srbct$x)   # 83 2308
hist(srbct$x)
srbct$y # 4 levels



