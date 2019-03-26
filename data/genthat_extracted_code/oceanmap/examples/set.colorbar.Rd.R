library(oceanmap)


### Name: set.colorbar
### Title: Adds colorbar to an extisting plot device
### Aliases: set.colorbar set.colorbarp
### Keywords: image plot widget colorbar

### ** Examples

## Example 1: plot colorbars manually
par(mar=c(8,8,8,8))
plot(0.5,0.5,xlim=c(0,1),ylim=c(0,1))
set.colorbar(cbx=c(0, 1), cby=c(-.3, -.4)) # bottom
set.colorbar(cby=c(0, 1), cbx=c(-.4, -.3)) # left
set.colorbar(cbx=c(0, 1), cby=c(1.2, 1.3)) # top
set.colorbar(cby=c(0, 1), cbx=c(1.2, 1.3)) # right 


## Example 2: use cbpos
par(mar=c(8,8,8,8))
plot(0.5,0.5,xlim=c(0,1),ylim=c(0,1))
set.colorbar(cbpos='b') # bottom
set.colorbar(cbpos='l') # left
set.colorbar(cbpos='t') # top
set.colorbar(cbpos='r') # right 


## Example 3: interactive placement
# par(mar=c(8,8,8,8))
# plot(0.5,0.5,xlim=c(0,1),ylim=c(0,1))
# cb <- set.colorbar() # interactive
# plot(0.5,0.5,xlim=c(0,1),ylim=c(0,1))
# set.colorbar(cbx=cb$cbx, cby=cb$cby) # reuse stored colorbar positions





