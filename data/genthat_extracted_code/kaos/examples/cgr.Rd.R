library(kaos)


### Name: cgr
### Title: Chaos Game Representation Object
### Aliases: cgr

### ** Examples

###HIV data
data("HIV")

### encoding the sequence
HIV.cgr = cgr(HIV, res = 100)

###plot the sequence
cgr.plot(HIV.cgr, mode = "points")

###plot the FCGR
cgr.plot(HIV.cgr, mode = "matrix")

###change the resolution of matrix from 100x100 to 200x200
cgr.res(HIV.cgr, 200)

### get the FCGR encoded vector
vectorize(HIV.cgr)





