library(multimode)


### Name: bw.crit
### Title: Critical bandwidth
### Aliases: bw.crit
### Keywords: mode testing

### ** Examples

# Critical bandwidth of Silverman (1981) for one mode.
set.seed(2016)
data=rnorm(50)
bw.crit(data)
# Critical bandwidth of Hall and York for two modes in the interval (-1.5,1.5).
set.seed(2016)
data=rnorm(50)
bw.crit(data,mod0=2,lowsup=-1.5,uppsup=1.5)



