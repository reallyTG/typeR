library(rsm)


### Name: djoin
### Title: Join designs together into a blocked design
### Aliases: djoin stdorder
### Keywords: design

### ** Examples

# Some existing data
CR1 <- coded.data(ChemReact1, x1 ~ (Time - 85)/5, x2 ~ (Temp - 175)/5)
# add the second part of the experiment; it gets coded automagically
djoin(CR1, ChemReact2)

# A new experiment in a different part of the design space
newdes <- cube(Yield ~ x1 + x2,  n0 = 3, 
    coding = c(x1 ~ (Time - 70)/10, x2 ~ (Temp - 180)/5))
# Time passes ... we do the experiment and plug-in the observed Yield values
newdes$Yield <- rnorm(7, 75, 3) # these are our pretend results
combined <- djoin(CR1, newdes)
# Observe that the combined dataset is recoded to the new formulas
print(combined, decode = FALSE)

# List the new design in standard order
stdorder(newdes)



