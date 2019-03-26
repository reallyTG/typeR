library(gsDesign)


### Name: Wang-Tsiatis Bounds
### Title: 5.0: Wang-Tsiatis Bounds
### Aliases: 'O'Brien-Fleming Bounds' 'Wang-Tsiatis Bounds' 'Pocock Bounds'
### Keywords: design

### ** Examples

# Pocock design
gsDesign(test.type=2, sfu="Pocock")

# alternate call to get Pocock design specified using 
# Wang-Tsiatis option and Delta=0.5
gsDesign(test.type=2, sfu="WT", sfupar=0.5)

# this is how this might work with a spending function approach
# Hwang-Shih-DeCani spending function with gamma=1 is often used 
# to approximate Pocock design
gsDesign(test.type=2, sfu=sfHSD, sfupar=1)

# unequal spacing works,  but may not be desirable 
gsDesign(test.type=2, sfu="Pocock", timing=c(.1, .2))

# spending function approximation to Pocock with unequal spacing 
# is quite different from this
gsDesign(test.type=2, sfu=sfHSD, sfupar=1, timing=c(.1, .2))

# One-sided O'Brien-Fleming design
gsDesign(test.type=1, sfu="OF")

# alternate call to get O'Brien-Fleming design specified using 
# Wang-Tsiatis option and Delta=0
gsDesign(test.type=1, sfu="WT", sfupar=0)



