library(stepp)


### Name: stwin-class
### Title: Class '"stwin"'
### Aliases: stwin-class summary,stwin-method
### Keywords: classes

### ** Examples

showClass("stwin")

# create a stepp window of type "sliding" with (r2) size of subpopulation
# in each window to be 200 and (r1) allows only 50 patients in the
# overlapping windows
mywin <- new("stwin", type="sliding", r1=50, r2=200)

# print a summary of the stepp window object created
summary(mywin)



