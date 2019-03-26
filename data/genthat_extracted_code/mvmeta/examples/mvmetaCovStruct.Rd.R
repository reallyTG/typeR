library(mvmeta)


### Name: mvmetaCovStruct
### Title: Covariance Structures for mvmeta Models
### Aliases: mvmetaCovStruct
### Keywords: models regression multivariate

### ** Examples

# UNSTRUCTURED AND STRUCTURED BETWEEN-STUDY (CO)VARIANCE
y <- as.matrix(fibrinogen[2:5])
S <- as.matrix(fibrinogen[6:15])
model <- mvmeta(y,S)
summary(model)
model$Psi

# DIAGONAL
model <- mvmeta(y,S,bscov="diag")
summary(model)
model$Psi

# HETEROGENEOUS COMPOUND SYMMETRY
model <- mvmeta(y,S,bscov="hcs")
summary(model)
model$Psi

# PROPORTIONAL
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S,bscov="prop",control=list(Psifix=diag(3)+1))
summary(model)
model$Psi

# CORRELATION
model <- mvmeta(y,S,bscov="cor",control=list(Psicor=0.2))
summary(model)
model$Psi



