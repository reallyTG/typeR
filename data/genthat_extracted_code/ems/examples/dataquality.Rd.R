library(ems)


### Name: dataquality
### Title: Collection of functions to check data quality in a dataset and
###   remove not valid or extreme values.
### Aliases: dataquality t_factor factor.table t_num num.table t_date
###   date.table rm.unwanted

### ** Examples

# Simulating a dataset with 5 factor variables and assigning labels
y <- data.frame(Var1 = sample(c("Yes","No", "Ignored", "", "yes ", NA), 200, replace = TRUE),
                Var2 = sample(c("Death","Discharge", "", NA), 200, replace = TRUE),
                Var3 = sample(c(16:35, NA), 200, replace = TRUE),
                Var4 = sample(c(12:300, "Female", "", NA), 200, replace = TRUE),
                Var5 = sample(c(60:800), 200, replace = TRUE))
attr(y, "var.labels") <- c("Intervention use","Unit destination","BMI","Age","Cholesterol")
summary(y)

# Cheking the quality only the first variable
t_factor(y, "Var1", c("Yes","No","Ignored"))

# Checking two or more variables at once
factor.limits  = list(list("Var1",c("Yes","No")),
                      list("Var2",c("Death","Discharge")))
factor.table(y, limits = factor.limits)

# Checking only one variable that shohuld be numeric
t_num(y,"Var3", num.min = 17, num.max = 32)

# Making the limits data.frame
num.limits <- data.frame(num.var = c("Var3","Var4","Var5"),
              num.min = c(17,18,70), num.max = c(32,110,300))
num.limits

# Checking two or more numeric variables (or the ones that
#          should be as numeric) at once
num.table(y, num.limits)

# Removing the unwanted values (extremes or not valid).
y <- rm.unwanted(data = y, limits = factor.limits,
                           num.limits = num.limits)
summary(y)

rm(y, num.limits, factor.limits)
#'
# Loading a dataset and assigning labels
data(icu)
attr(icu, "var.labels")[match(c("UnitAdmissionDateTime","UnitDischargeDateTime",
   "HospitalAdmissionDate", "HospitalDischargeDate"), names(icu))] <-
   c("Unit admission","Unit discharge","Hospital admission","Hospital discharge")

# Checking only one variable that should be a date.
t_date(icu, "HospitalDischargeDate", date.max = as.Date("2013-10-30"),
                                     date.min = as.Date("2013-02-20"))

# Checking a date variable misspecifying the date format
# will cause the variable dates to be identified as non-date values.
t_date(data = icu, date.var = "HospitalDischargeDate",
                   date.max = as.Date("2013-10-30"),
                   date.min = as.Date("2013-02-20"),
                   format.date = "%d/%m/%Y")

# Making a limit data.frame assuming an 'auto' format.date
d.lim <- data.frame(date.var = c("UnitAdmissionDateTime","UnitDischargeDateTime",
                   "HospitalAdmissionDate","HospitalDischargeDate"),
                   date.min = rep(as.Date("2013-02-28"), 4),
                   date.max = rep(as.Date("2013-11-30"), 4))
d.lim

# Checking two or more date variables (or the ones that should be as date) at once
date.table(data = icu, date.limits = d.lim)

# Making a limit data.frame specifying format.date argument
# Here the the last 'format.date' is missspecified on purpose
# So, the last date will be identified as non-date values.
d.lim <- data.frame(date.var = c("UnitAdmissionDateTime","UnitDischargeDateTime",
         "HospitalAdmissionDate","HospitalDischargeDate"),
          date.min = rep(as.Date("2013-02-28"), 4),
          date.max = rep(as.Date("2013-11-30"), 4),
          format.date = c(rep("%Y/%m/%d",3), "%Y-%m-%d"))
d.lim

# Checking the quality of date variable with new limits.
# The 'format.date = ""' is required to force the function to look the format
# into the date.limits data.frame
date.table(data = icu, date.limits = d.lim, format.date = "")

rm(icu, d.lim)




