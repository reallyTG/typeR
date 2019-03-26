library(memisc)


### Name: percentages
### Title: Easy Creation of Tables of Percentages
### Aliases: percentages percentages.formula percentages.table
###   as.data.frame.percentage.table as.data.frame.xpercentage.table

### ** Examples


# Two equivalent ways to create the same table
100*prop.table(UCBAdmissions)
percentages(UCBAdmissions)

# Three equivalent ways to create the same table
100*prop.table(UCBAdmissions,c(2,3))
(p0 <- percentages(UCBAdmissions,by=c("Gender","Dept")))
percentages(UCBAdmissions,which="Admit")
# Percentage table as data frame
as.data.frame(p0)

# Three equivalent ways to create the same table
100*prop.table(margin.table(UCBAdmissions,c(1,2)),2)
percentages(UCBAdmissions,which="Admit",by="Gender")
percentages(Admit~Gender,data=UCBAdmissions)

# Three equivalent ways to create the same table
100*prop.table(margin.table(UCBAdmissions,c(1,3)),2)
percentages(Admit~Dept,data=UCBAdmissions)
percentages(Admit~Dept,data=as.data.frame(UCBAdmissions),
            weights="Freq")

# Standard errors and confidence intervals
percentages(Admit~Dept,data=UCBAdmissions,se=TRUE)
percentages(Admit~Dept,data=UCBAdmissions,ci=TRUE)
(p<- percentages(Admit~Dept,data=UCBAdmissions,ci=TRUE,se=TRUE))

# An extended table of percentages as data frame
as.data.frame(p)



