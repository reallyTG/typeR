library(oce)


### Name: swRho
### Title: Seawater density
### Aliases: swRho

### ** Examples

library(oce)
# The numbers in the comments are the check values listed in reference [1];
# note that temperature in that reference was on the T68 scale, but that
# the present function works with the ITS-90 scale, so a conversion
# is required.
swRho(35, T90fromT68(5),      0, eos="unesco") # 1027.67547
swRho(35, T90fromT68(5),  10000, eos="unesco") # 1069.48914
swRho(35, T90fromT68(25),     0, eos="unesco") # 1023.34306
swRho(35, T90fromT68(25), 10000, eos="unesco") # 1062.53817




