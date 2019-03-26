library(lessR)


### Name: Logit
### Title: Logit Regression Analysis
### Aliases: Logit lr
### Keywords: regression logit

### ** Examples

# Gender has values of "M" and "F"
d <- Read("Employee", in.lessR=TRUE, quiet=TRUE)
# logit regression
Logit(Gender ~ Years)

# short name
lr(Gender ~ Years)

# Modify the default settings as specified
Logit(Gender ~ Years, res.row=8, res.sort="rstudent", digits.d=8, pred=FALSE)

# just for employees who have worked more than 5 years at the firm
Logit(Gender ~ Years, rows=(Years > 5))

# Multiple logistic regression model
# Provide all default analyses
Logit(Gender ~ Years + Salary)

# compare nested models
# easier and better treatment of missing data to use lessR function:  Nest
full.model <- Logit(Gender ~ Years + Salary)
reduced.model <- Logit(Gender ~ Years)
anova(reduced.model, full.model)

# Save the three plots as pdf files 4 inches square, gray scale
Logit(Gender ~ Years, pdf.file="MyModel.pdf",
      width=4, height=4, colors="gray")

# Specify new values of the predictor variables to calculate
#  forecasted values
# Specify an input data frame other than d
d <- Read("Cars93", in.lessR=TRUE)
Logit(Source ~ HP + MidPrice, X1.new=seq(100,250,50), X2.new=c(10,60,10))



