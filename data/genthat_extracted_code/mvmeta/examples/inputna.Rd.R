library(mvmeta)


### Name: inputna
### Title: Input Missing Values
### Aliases: inputna
### Keywords: manip

### ** Examples

# INSPECT THE DATA
head(smoking)

# STANDARD APPROACH TO MISSING DATA
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S)
summary(model)

# WITH DATA AUGMENTATION
augdata <- inputna(y,S)
y <- augdata[,1:3]
S <- augdata[,-c(1:3)]
model <- mvmeta(y,S)
summary(model)
# NB: SAME PARAMETER ESTIMATES, BUT WRONG NYUMBER OF OBS

# USED INTERNALLY IN mvmeta
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S,control=list(inputna=TRUE))
summary(model)
# NOW RIGHT NUMBER OF OBS



