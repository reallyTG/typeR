library(lessR)


### Name: Recode
### Title: Recode the Values of an Integer or Factor Variable
### Aliases: Recode rec
### Keywords: recode

### ** Examples

# construct data frame
d <- read.table(text="Severity Description
1 Mild
4 Moderate
3 Moderate
2 Mild
1 Severe", header=TRUE)

# recode Severity into a new variable called SevereNew
d <- Recode(Severity, new.vars="SevereNew", old=1:4, new=c(10,20,30,40))

# abbreviated form,  replace original with recoded
# another option, the sequence function, to generate list of values
d <- rec(Severity, old=1:4, new=seq(10,40,by=10))

# reverse score four Likert variables: m01, m02, m03, m10 
d <- Read("Mach4", in.lessR=TRUE)
d <- Recode(c(m01:m03,m10), old=0:5, new=5:0)

# convert any 1 for Plan to missing
# use Read to put data into d data frame
# write results to newdata data frame
d <- Read("Employee", in.lessR=TRUE)
newdata <- Recode(Plan, old=1, new="missing")

# for Years and Salary convert any missing value to 99
d <- Recode(c(Years, Salary), old="missing", new=99)


# ------------------------------------
# convert between factors and integers
# ------------------------------------

# recode levels of a factor that should remain a factor
#   with the Transform and factor functions
# using Recode destroys the factor attribute, converting to
#   character strings instead, so Recode does not allow
d <- Read("Employee", in.lessR=TRUE)
d <- Transform(
    Gender=factor(Gender, levels=c("F", "M"), labels=c("Female", "Male"))
)

# recode levels of a factor to convert to integer first by
#   converting to integer with Transform and as.numeric
# here Gender has values M and F in the data
# integers start with 1 through the number of levels, can use
#   Recode to change this if desired, such as to 0 and 1
d <- Transform(Gender=as.numeric(Gender))
d <- Recode(Gender, old=c(1,2), new=c(0,1))

# recode integer values to levels of a factor with value labels
#   with the Transform function instead of Recode
# here Gender has values 0 and 1 in the data
d <- Read("Mach4", in.lessR=TRUE)
d <- Transform(
      Gender=factor(Gender, levels=c(0,1), labels=c("Male","Female"))
      )
# ------------------------------------



