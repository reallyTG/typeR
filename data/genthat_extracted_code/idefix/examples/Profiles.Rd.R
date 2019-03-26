library(idefix)


### Name: Profiles
### Title: Profiles generation.
### Aliases: Profiles

### ** Examples

# Without continuous attributes
at.lvls <- c(3, 4, 2) # 3 Attributes with respectively 3, 4 and 2 levels. 
c.type <- rep("E", length(at.lvls)) # All Effect coded.
Profiles(lvls = at.lvls, coding = c.type) # Generate profiles.

# With continuous attributes 
at.lvls <- c(3, 4, 2) # 3 attributes with respectively 3, 4 and 2 levels. 
# First attribute is dummy coded, second and third are continuous. 
c.type <- c("D", "C", "C") 
# Levels for continuous attributes, in the same order. 
con.lvls <- list(c(4, 6, 8, 10), c(7, 9))
Profiles(lvls = at.lvls, coding = c.type, c.lvls = con.lvls)



