library(flows)


### Name: prepflows
### Title: Flows Preparation
### Aliases: prepflows

### ** Examples

# Import data
data(nav)
head(nav)
# Prepare data
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")
myflows[1:5,1:5]



