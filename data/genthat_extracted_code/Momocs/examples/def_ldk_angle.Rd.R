library(Momocs)


### Name: def_ldk_angle
### Title: Add new landmarks based on angular positions
### Aliases: def_ldk_angle def_ldk_direction def_ldk_direction.default
###   def_ldk_direction.Out def_ldk_direction.Opn

### ** Examples

# adds a new landmark towards south east
hearts %>%
   slice(1:5) %>% # for speed purpose only
   def_ldk_angle(-pi/6) %>%
stack()

# on Out and towards NW and NE here
olea %>%
   slice(1:5) %>% #for speed purpose only
   def_ldk_angle(3*pi/4) %>%
   def_ldk_angle(pi/4) %>%
   stack




