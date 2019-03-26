library(RM.weights)


### Name: RM.w
### Title: Estimation of the weighted Rasch model using CML
### Aliases: RM.w

### ** Examples

data(data.FAO_country1)
# Questionnaire data and weights
XX.country1 = data.FAO_country1[,1:8]
wt.country1 = data.FAO_country1$wt
# Fit weighted Rasch
rr.country1 = RM.w(XX.country1, wt.country1)
# Fit unweighted Rasch
rr.country1.nw = RM.w(XX.country1)

# Item severity
rr.country1$b

# Item standard error
rr.country1$se.b

# Respondent severity for each raw score
rr.country1$a

# Respondent measurement error for each raw score
rr.country1$se.a

# Item infit  
rr.country1$infit

# Item outfit 
rr.country1$outfit

# Rasch reliability based on observed distribution of cases across raw scores
rr.country1$reliab

# Rasch reliability  based on equal proportion of cases in each 
# non-extreme raw score (more comparable across datasets)
rr.country1$reliab.fl

# Checking conditional independence: residual correlation matrix 
rr.country1$res.cor




