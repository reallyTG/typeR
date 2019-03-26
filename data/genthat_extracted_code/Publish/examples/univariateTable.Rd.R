library(Publish)


### Name: univariateTable
### Title: Univariate table
### Aliases: univariateTable utable

### ** Examples

data(Diabetes)
univariateTable(~age,data=Diabetes)
univariateTable(~gender,data=Diabetes)
univariateTable(~age+gender+ height+weight,data=Diabetes)
## same thing but less typing
utable(~age+gender+ height+weight,data=Diabetes)

## summary by location: 
univariateTable(location~Q(age)+gender+height+weight,data=Diabetes)
## continuous variables marked with Q() are (by default) summarized
## with median (IQR) and kruskal.test (with two groups equivalent to wilcox.test)
## variables not marked with Q() are (by default) summarized
## with mean (sd) and anova.glm(...,test="Chisq")
## the p-value of anova.glm with only two groups is similar
## but not exactly equal to that of a t.test
## categorical variables are (by default) summarized by count
## (percent) and anova.glm(...,family=binomial,test="Chisq")

## export result to csv
table1 = summary(univariateTable(location~age+gender+height+weight,data=Diabetes),
show.pvalues=FALSE)
# write.csv(table1,file="~/table1.csv",rownames=FALSE)

## change labels and values
utable(location~age+gender+height+weight,data=Diabetes,
       age="Age (years)",gender="Sex",
       gender.female="Female",
       gender.male="Male",
       height="Body height (inches)",
       weight="Body weight (pounds)")

## Use quantiles and rank tests for some variables and mean and standard deviation for others
univariateTable(gender~Q(age)+location+Q(BMI)+height+weight,
                data=Diabetes)

## Factor with more than 2 levels
Diabetes$AgeGroups <- cut(Diabetes$age,
                          c(19,29,39,49,59,69,92),
                          include.lowest=TRUE)
univariateTable(location~AgeGroups+gender+height+weight,
                data=Diabetes)

## Row percent
univariateTable(location~gender+age+AgeGroups,
                data=Diabetes,
                column.percent=FALSE)

## change of frequency format
univariateTable(location~gender+age+AgeGroups,
                data=Diabetes,
                column.percent=FALSE,
                freq.format="percent(x) (n=count(x))")

## changing Labels
u <- univariateTable(location~gender+AgeGroups+ height + weight,
                     data=Diabetes,
                     column.percent=TRUE,
                     freq.format="count(x) (percent(x))")
summary(u,"AgeGroups"="Age (years)","height"="Height (inches)")

## more than two groups
Diabetes$frame=factor(Diabetes$frame,levels=c("small","medium","large"))
univariateTable(frame~gender+BMI+age,data=Diabetes)

Diabetes$sex=as.numeric(Diabetes$gender)
univariateTable(frame~sex+gender+BMI+age,
                data=Diabetes,freq.format="count(x) (percent(x))")

## multiple summary formats
## suppose we want for some reason mean (range) for age
## and median (range) for BMI.
## method 1:
univariateTable(frame~Q(age)+BMI,
                data=Diabetes,
                Q.format="mean(x) (range(x))",
                summary.format="median(x) (range(x))")
## method 2:
u1 <- summary(univariateTable(frame~age,
                              data=na.omit(Diabetes),
                              summary.format="mean(x) (range(x))"))
u2 <- summary(univariateTable(frame~BMI,
                              data=na.omit(Diabetes),
                              summary.format="median(x) (range(x))"))
publish(rbind(u1,u2),digits=2)




