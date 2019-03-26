library(DiffusionRjgqd)


### Name: JGQD.plot
### Title: Quick Plots for DiffusionRjgqd Objects
### Aliases: JGQD.plot
### Keywords: plot

### ** Examples

  ## No test: 
#===============================================================================
# Plot the transitional density of a jump diffusion
#-------------------------------------------------------------------------------
rm(list=ls(all=TRUE))
library(DiffusionRjgqd)

JGQD.remove()
# Define the jump diffusion using the DiffusionRjgqd syntax:
G1=function(t){0.2*5+0.1*sin(2*pi*t)}
G2=function(t){-0.2}
Q1=function(t){0.2}

# State dependent intensity:
Lam0 = function(t){1}
Lam1    = function(t){0.1}

# Normally distributed jumps: N(1,0.2)
Jmu    = function(t){1.0}
Jsig   = function(t){0.2}
# Normal distribution is the default:
res_1  = JGQD.density(4,seq(2,10,1/10),0,2.5,1/100,factorize=FALSE)

JGQD.plot(res_1)

  
## End(No test)



