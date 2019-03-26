library(INDperform)


### Name: statespace_ed
### Title: Euclidean distance in state space
### Aliases: statespace_ed

### ** Examples

# Using the Baltic Sea demo data in the package
ind_sel <- ind_ex[,c(2,3,4,8,10,11)]
# --> selection of complementary and well performing indicators
# There are different ways to define the reference time step:
ed <- statespace_ed(x = ind_sel, time = ind_ex$Year, ref_time = ind_ex$Year[1])
ed <- statespace_ed(x = ind_sel, time = ind_ex$Year, ref_time = 1987)
ed <- statespace_ed(x = ind_sel, time = ind_ex$Year, ref_time = "1987")



