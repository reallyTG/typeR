library(C443)


### Name: growforest
### Title: Grow a forest of classification trees or tree-based treatment
###   regimes
### Aliases: growforest

### ** Examples

require(MASS)

# Create forest by drawing bootstrap samples and growing a tree on each bootstrap sample
forest <- growforest(data = Pima.tr, X = c("npreg", "glu",  "bp",  "skin",  "bmi", "ped", "age"), 
Y = "type", ntrees = 50)

# Create forest by drawing bootstrap samples and growing a tree for each outcome variable
# on each bootstrap sample
forest <- growforest(data= drugs, X =c ("Age", "Gender", "Edu", "Neuro", "Extr", "Open", "Agree", 
"Consc", "Impul","Sensat"), Y = c("Amphet", "Benzos", "Coke", "Ecst", "Leghighs", "LSD", "Mush",
 "Amyl", "Ket"), ntrees = 8)



