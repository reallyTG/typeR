library(meta)


### Name: bubble.metareg
### Title: Bubble plot to display the result of a meta-regression
### Aliases: bubble bubble.metareg
### Keywords: hplot

### ** Examples

data(Fleiss93cont)

# Add some (fictitious) grouping variables:
Fleiss93cont$age <- c(55, 65, 52, 65, 58)
Fleiss93cont$region <- c("Europe", "Europe", "Asia", "Asia", "Europe")

meta1 <- metacont(n.e, mean.e, sd.e,
                  n.c, mean.c, sd.c,
                  data=Fleiss93cont, sm="MD")

mr1 <- metareg(meta1, region)
mr1

bubble(mr1)
bubble(mr1, lwd=2, col.line="blue")

mr2 <- metareg(meta1, age)
mr2

bubble(mr2, lwd=2, col.line="blue", xlim=c(50, 70))
bubble(mr2, lwd=2, col.line="blue", xlim=c(50, 70), cex="fixed")

# Do not print regression line
#
bubble(mr2, lwd=2, col.line="blue", xlim=c(50, 70), regline=FALSE)



