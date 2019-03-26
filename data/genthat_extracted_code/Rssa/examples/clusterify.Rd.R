library(Rssa)


### Name: grouping.auto.wcor
### Title: Group Elementary Series Using W-correlation Matrix
### Aliases: grouping.auto.wcor grouping.auto.wcor.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Form 3 series from the initial 6 ones:
lst <- grouping.auto(s, grouping.method = "wcor",
                     groups = 1:6, nclust=3)
# Automatic grouping:
print(lst)
plot(lst)
# Check separability
w <- wcor(s, groups = lst)
plot(w)



