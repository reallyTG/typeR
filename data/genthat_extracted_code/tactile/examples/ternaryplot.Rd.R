library(tactile)


### Name: ternaryplot
### Title: Ternary Plot
### Aliases: ternaryplot ternaryplot.formula ternaryplot.data.frame
###   ternaryplot.matrix

### ** Examples

ternaryplot(Fertility ~ Agriculture * Catholic, data = swiss)
ternaryplot(Catholic ~ Examination * Education, response = Infant.Mortality,
            data = swiss, contour = FALSE)

ternaryplot(Or ~ An * Ab | Feldspar, data = feldspar)

ternaryplot(Or ~ An * Ab, groups = Feldspar, data = feldspar, density = TRUE)



