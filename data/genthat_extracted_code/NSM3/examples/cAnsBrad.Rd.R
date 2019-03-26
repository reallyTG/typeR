library(NSM3)


### Name: cAnsBrad
### Title: Function to compute a critical value for the Ansari-Bradley C
###   distribution.
### Aliases: cAnsBrad
### Keywords: Ansari-Bradley

### ** Examples

##Hollander, Wolfe, Chicken - NSM3 - Example 5.1 (Serum Iron Determination):
cAnsBrad(0.05,20,20,"Asymptotic")
cAnsBrad(0.05,20,20,"Exact")

##Bigger data
cAnsBrad(0.05,100,100,"Exact")



