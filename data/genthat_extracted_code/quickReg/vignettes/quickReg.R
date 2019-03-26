## ----set, echo=FALSE--------------------------------------------------------------------------------------------------------------------------------
# Change the width of html file
options(width = 150,tibble.print_max=50)



## ----data-------------------------------------------------------------------------------------------------------------------------------------------

# If you haven't install the package, you can download it from cran

# install.packages("quickReg")

library(quickReg)
library(ggplot2)
library(rlang)
library(dplyr)

# Load the dataset

data(diabetes)

# Show the first 6 rows of the data

head(diabetes)


## ----display----------------------------------------------------------------------------------------------------------------------------------------

display_1<-display_table(data=diabetes,variables=c("age","smoking","education"),group="CFHrs2230199")
display_1

# You could do a sub-group analysis by sex
display_2<-display_table_group(data=diabetes,variables=c("age","smoking"),group="CFHrs2230199",super_group = "sex")
display_2

# You could do a sub-group analysis by two variables
display_3<-display_table_group(data=diabetes,variables=c("age","smoking"),group="CFHrs2230199",super_group = c("sex","education"))
display_3


# Sub-group analysis can be a combination
display_4<-display_table_group(data=diabetes,variables=c("age","smoking"),group="CFHrs2230199",super_group = c("sex","education"),group_combine = TRUE)
display_4



## ----quickReg---------------------------------------------------------------------------------------------------------------------------------------

# Apply univariate regression models

reg_1<-reg_x(data = diabetes, y = 5, factors = c(1, 3, 4), model = 'glm')
reg_1

# Or a survial analysis

reg_2<-reg_x(data = diabetes, x = c(3:4, 6), y ="diabetes",time=2,factors = c(1, 3, 4), model = 'coxph')
reg_2

# adjust some covariates

reg_3<-reg_x(data = diabetes, x = c("sex","age"), y ="diabetes" ,cov=c("CFBrs641153","CFHrs2230199"), factors ="sex", model = 'glm',cov_show = TRUE)
reg_3


# How about regression on several dependent variables
reg_4<-reg_y(data = diabetes, x = c("sex","age","CFHrs1061170"), y =c("systolic","diastolic","BMI") ,cov=c("CFBrs641153","CFHrs2230199"), factors ="sex", model = 'lm')
reg_4

# Cool, but I want to do a subgroup analysis

reg_5<-reg(data = diabetes, x = c("age","CFHrs1061170"), y =c("systolic","diastolic") ,cov=c("CFBrs641153","CFHrs2230199"), model = 'lm',group="sex")
reg_5


# or two subgroup analysis
reg_6<-reg(data = diabetes, x = c("age","CFHrs1061170"), y =c("systolic","diastolic") ,cov=c("CFBrs641153","CFHrs2230199"), model = 'lm',group=c("sex","smoking"))
reg_6


# or subgroup combination analysis
reg_7<-reg(data = diabetes, x = c("age","CFHrs1061170"), y =c("systolic","diastolic") ,cov=c("CFBrs641153","CFHrs2230199"), model = 'lm',group=c("sex","smoking"),group_combine = TRUE)
reg_7



## ----plot,fig.width=8,fig.height=5------------------------------------------------------------------------------------------------------------------

# good idea

plot(reg_1)

# One OR value is larger than others, we can set the limits
plot(reg_1,limits=c(NA,3))


# Sort the variables according to alphabetical

plot(reg_1,limits=c(NA,3), sort ="alphabetical")

# Similarly, we can plot for several dependent variables result

plot(reg_4)


# Subgroup and several dependent variables result
plot(reg_5)+facet_grid(sex~y)



# Actually, you can modify the plot like ggplot2 
library(ggplot2);library(ggthemes)

plot(reg_1,limits=c(0.5,2))+
  labs(list(title = "Regression Model", x = "variables"))+
  theme_classic() %+replace% 
  theme(legend.position ="none",axis.text.x=element_text(angle=45,size=rel(1.5)))


