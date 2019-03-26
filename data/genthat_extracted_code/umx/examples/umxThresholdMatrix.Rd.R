library(umx)


### Name: umxThresholdMatrix
### Title: Create the threshold matrix needed for modeling ordinal data.
### Aliases: umxThresholdMatrix

### ** Examples

# ============================
# = Simple non-twin examples =
# ============================
# One ordered factor with 2-levels
x = data.frame(ordered(rbinom(100,1,.5))); names(x) <- c("x")
tmp = umxThresholdMatrix(x, selDVs = "x")
# The lower ones matrix (all fixed)
tmp[[1]]$values

# The deviations matrix
tmp[[2]]$values
tmp[[2]]$labels # note labels are equated across twins

# The algebra that assembles these into thresholds:
tmp[[3]]$formula

# Example of a warning to not omit the variable names
# tmp = umxThresholdMatrix(x)
# Just a polite message, but for coding safety, I recommend calling
# umxThresholdMatrix with the names of the variables in the model.
#   Next time, please include selDVs (AND you MUST include sep if this is a twin model!!)

# One ordered factor with 5-levels
x = cut(rnorm(100), breaks = c(-Inf,.2,.5, .7, Inf)); levels(x) = 1:5
x = data.frame(ordered(x)); names(x) <- c("x")
tmp = umxThresholdMatrix(x, selDVs = "x")

# =================================
# = Binary example with twin data =
# =================================
data(twinData)

# ===============================================================
# = Create a series of binary and ordinal columns to work with =
# ===============================================================

# Example 1
# Cut to form category of 20 % obese subjects
obesityLevels = c('normal', 'obese')
cutPoints <- quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
twinData$obese1 <- cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 <- cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
# Step 2: Make the ordinal variables into umxFactors (ordered, with the levels found in the data)
selVars = c("obese1", "obese2")
twinData[, selVars] <- umxFactor(twinData[, selVars])

# use verbose = TRUE to see informative messages
tmp = umxThresholdMatrix(twinData, selDVs = selVars, sep = "", verbose = TRUE) 


# ======================================
# = Ordinal (n categories > 2) example =
# ======================================
# Repeat for three-level weight variable
obesityLevels = c('normal', 'overweight', 'obese')
cutPoints = quantile(twinData[, "bmi1"], probs = c(.4, .7), na.rm = TRUE)
twinData$obeseTri1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obeseTri2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
selDVs = "obeseTri"; selVars = tvars(selDVs, sep = "", suffixes = 1:2)
twinData[, selVars] = umxFactor(twinData[, selVars])
tmp = umxThresholdMatrix(twinData, selDVs = selVars, sep = "", verbose = TRUE)

# ========================================================
# = Mix of all three kinds example (and a 4-level trait) =
# ========================================================
obesityLevels = c('underWeight', 'normal', 'overweight', 'obese')
cutPoints = quantile(twinData[, "bmi1"], probs = c(.25, .4, .7), na.rm = TRUE)
twinData$obeseQuad1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obeseQuad2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
selVars = c("obeseQuad1", "obeseQuad2")
twinData[, selVars] = mxFactor(twinData[, selVars], levels = obesityLevels)

selDVs =c("bmi", "obese", "obeseTri", "obeseQuad")
tmp = umxThresholdMatrix(twinData, selDVs = tvars(selDVs, sep= ""), sep = "", verbose = TRUE)
# The lower ones matrix (all fixed)
tmp[[1]]$values
# The deviations matrix
tmp[[2]]$values
tmp[[2]]$labels # note labels are equated across twins
# Check to be sure twin-1 column labels same as twin-2
tmp[[2]]$labels[,2]==tmp[[2]]$labels[,4]


# The algebra that assembles these into thresholds:
tmp[[3]]$formula




