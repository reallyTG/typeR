library(mvmeta)


### Name: smoking
### Title: Meta-Analysis of Interventions to Promote Smoking Cessation
### Aliases: smoking
### Keywords: datasets

### ** Examples

### REPRODUCE THE RESULTS IN WHITE (2011)

# INSPECT THE DATA
head(smoking)
names(smoking)

# UNSTRUCTURED BETWEEN-STUDY (CO)VARIANCE
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S)
summary(model)

# STRUCTURED BETWEEN-STUDY (CO)VARIANCE (PROPORTIONAL)
model <- mvmeta(y,S,bscov="prop",control=list(Psifix=diag(3)+1))
summary(model)

# SEE help(mvmetaCovStruct) for additional info and examples



