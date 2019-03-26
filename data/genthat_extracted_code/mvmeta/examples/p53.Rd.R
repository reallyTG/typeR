library(mvmeta)


### Name: p53
### Title: Mutant p53 Gene and Squamous Cell Carcinoma
### Aliases: p53
### Keywords: datasets

### ** Examples

### REPRODUCE THE RESULTS OF EXAMPLE 3 IN JACKSON ET AL. (2011)

# INSPECT THE DATA
p53

# REML MODEL WITH INPUTTED CORRELATION EQUAL TO 0.95
model <- mvmeta(cbind(y1,y2),cbind(V1,V2),data=p53,control=list(Scor=0.95))
print(summary(model),digits=2)



