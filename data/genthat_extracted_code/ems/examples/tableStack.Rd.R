library(ems)


### Name: tableStack
### Title: Tabulation of variables in a stack form
### Aliases: tableStack

### ** Examples

set.seed(1)
data <- data.frame(sex = sample(c("M","F"), 50, rep = TRUE),
age = sample(c(NA,20:70), 50, rep = TRUE),
admissionType = sample(c(NA,"urgency", "clinical", "scheduled"), 50, rep = TRUE),
hospitalizationTime = sample(c(0:10), 50, rep = TRUE),
numberOfChildren = sample(c(NA,0:3), 50, rep = TRUE),
cancerInFamily = sample(c(NA,TRUE,FALSE), 50, rep = TRUE),
diabetesInFamily = sample(c(TRUE,FALSE), 50, rep = TRUE),
thrombosisInFamily = sample(c(TRUE,FALSE), 50, rep = TRUE),
mentaldiseasesInFamily = sample(c(TRUE,FALSE), 50, rep = TRUE),
cardiadicdiseaseInFamily = sample(c(NA,TRUE,FALSE), 50, rep = TRUE),
readmission = sample(c(NA,TRUE,FALSE), 50, rep = TRUE))

attach(data)
tableStack(cancerInFamily:cardiadicdiseaseInFamily, dataFrame = data)
detach(data)
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data) # Default data frame is data
# "by" compares variables
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data, by= readmission)
# "prevalence" returns the prevalence instead of the absolute values
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data,
by= readmission, prevalence=TRUE)
# "percent" as FALSE hides the percentage in parenthesis
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data,
by= readmission, percent=FALSE)
# "name.test" as FALSE hides the column that shows the tests names
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data,
by= readmission, percent=FALSE, name.test=FALSE)
# "NAcol" displays a column of NA values on the variable on "by"
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data,
by= readmission, NAcol = TRUE)
# "NArow" displays rows of NA values on the variables on "vars"
tableStack(cancerInFamily:cardiadicdiseaseInFamily, data,
by= readmission, NAcol = TRUE, NArow = TRUE)

# the specification of the vars may be done as the range
tableStack(vars=2:7, data, by=sex)
# "by" var may be specified as "none" and the selected vars will be crossed only against the total
tableStack(vars=2:7, data, by="none")
# by = NONE works just as by = "none"
tableStack(vars=2:7, data, by = NONE)
# total.column displays a column of totals in adition to the variable on by
tableStack(vars=2:7, data, by=sex, total.column=TRUE)

var.labels <- c("sex", "Type of admission for each patient",
"age", "Duration time in days of the patient's hospitalization",
"Number of children that the patient have",
"whether or not the patient has cancer in family",
"whether or not the patient has diabetes in family",
"whether or not the patient has thrombosis in family",
"whether or not the patient has mental diseases in family",
"whether or not the patient has cardiac diseases in family",
"whether or not the patient is on a relapse admission")
#setting the attribute var.labels
attr(data, "var.labels") <- var.labels
rm(var.labels)

# May need full screen of Rconsole
tableStack(vars=c(numberOfChildren,hospitalizationTime), data)
# Fits in with default R console screen
tableStack(vars=c(numberOfChildren,hospitalizationTime), data,
var.labels.trunc=35)
tableStack(vars=c(age,numberOfChildren,hospitalizationTime),
data, reverse=TRUE) -> a
a
## Components of 'a' have appropriate items reversed
a$mean.score -> mean.score
a$total.score -> total.score
data$mean.score <- mean.score
data$total.score <- total.score

# hiding the test column
tableStack(c(age, numberOfChildren,hospitalizationTime,
mean.score,total.score), data, by=sex, test=FALSE)
# variables specified on iqr will not display SD but IQR instead
tableStack(3:5, data, by=sex, iqr=hospitalizationTime)
## 'vars' can be mixture of variables of different classes
tableStack(3:5, data, by=admissionType,
iqr=c(hospitalizationTime, total.score))

data$highscore <- mean.score > 4
# a variable with some comparison may be created easily
tableStack(mean.score:highscore, data,
by=sex, iqr=total.score)

# the percentage information may be hidden
tableStack(vars=c(readmission,admissionType),
data, by=sex, percent="none")
# it may be shown the prevalende of the
# variable instead of the values themselves
tableStack(vars=c(readmission,admissionType), data,
by=sex, prevalence = TRUE)
# the name of the tests may be hidden
# while the test itself still shows
tableStack(vars=c(readmission,admissionType), data,
by=sex, name.test = FALSE)

## Variable in numeric or factor
# as continuous varaibles
tableStack(vars=3:5, data, by=sex)
# as factors
tableStack(vars=3:5, data, by=sex, vars.to.factor = 3:5)

## Using drplvls
# a dataframe will be created containing a factor with an unused level
bloodbank <- data.frame(AgeInDays =
    sample(0:15,200, replace = TRUE), Type =
    factor(sample(c("A","B","0"), 200, replace = TRUE),
      levels = c("A","B","AB","0")), Origin =
    sample(c("US","CA"), 200, replace = TRUE))

# by using drplvls the row of the unused fator is hidden
tableStack(vars = c(AgeInDays, Type),
bloodbank, by = Origin) #usual
tableStack(vars = c(AgeInDays, Type),
bloodbank, by = Origin,
drplvls = TRUE) # with drplvls

rm(total.score, mean.score, a, data, bloodbank)



