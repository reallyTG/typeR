library(ore)


### Name: ore.subst
### Title: Replace matched substrings with new text
### Aliases: ore.subst ore_subst

### ** Examples

# Simple text substitution (produces "no dogs")
ore.subst("\\d+", "no", "2 dogs")

# Back-referenced substitution (produces "22 dogs")
ore.subst("(\\d+)", "\\1\\1", "2 dogs")

# Function-based substitution (produces "4 dogs")
ore.subst("\\d+", function(i) as.numeric(i)^2, "2 dogs")



