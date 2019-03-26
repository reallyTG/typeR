library(NSM3)


### Name: pAnsBrad
### Title: Function to compute the P-value for the observed Ansari-Bradley
###   C statistic.
### Aliases: pAnsBrad
### Keywords: Ansari-Bradley

### ** Examples

##Hollander, Wolfe, Chicken Example 5.1 Serum Iron Determination:
serum<-list(ramsay = c(111, 107, 100, 99, 102, 106, 109, 108, 104, 99, 101, 96, 97, 102, 107,
113, 116, 113, 110, 98),
jung.parekh = c(107, 108, 106, 98, 105, 103, 110, 105, 104, 100, 96, 108, 103, 104, 114, 114,
113, 108, 106, 99))


pAnsBrad(serum)

##or, equivalently:
pAnsBrad(serum$ramsay, serum$jung.parekh)




