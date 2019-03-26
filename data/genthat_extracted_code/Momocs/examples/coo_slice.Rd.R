library(Momocs)


### Name: coo_slice
### Title: Slices shapes between successive coordinates
### Aliases: coo_slice

### ** Examples

h <- slice(hearts, 1:5)  # speed purpose only
# single shape, a list of matrices is returned
sh <- coo_slice(h[1], c(12, 24, 36, 48))
coo_plot(sh[[1]])
panel(Opn(sh))
# on a Coo, a list of Opn is returned
# makes no sense if shapes are not normalized first
sh2 <- coo_slice(h, c(12, 24, 36, 48))
panel(sh2[[1]])

# Use coo_slice with `ldk` instead:
# hearts as an example
x <- h %>% fgProcrustes(tol=1)
# 4 landmarks
stack(x)
x$ldk[1:5]

# here we slice
y <- coo_slice(x, ldk=1:4)

# plotting
stack(y[[1]])
stack(y[[2]])

# new ldks from tipping points, new ldks from angle
olea %>% slice(1:5) %>% # for the sake of speed
def_ldk_tips %>%
def_ldk_angle(0.75*pi) %>% def_ldk_angle(0.25*pi) %>%
coo_slice(ldk =1:4) -> oleas
oleas[[1]] %>% stack
oleas[[2]] %>% stack # etc.

# domestic operations
y[[3]] %>% coo_area()
# shape analysis of a slice
y[[1]] %>% coo_bookstein() %>% npoly %>% PCA %>% plot(~aut)




