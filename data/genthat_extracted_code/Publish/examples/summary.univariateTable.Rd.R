library(Publish)


### Name: summary.univariateTable
### Title: Preparing univariate tables for publication
### Aliases: summary.univariateTable

### ** Examples

data(Diabetes)
u <- univariateTable(gender~age+location+Q(BMI)+height+weight,
                data=Diabetes)
summary(u)
summary(u,n=NULL)
summary(u,pvalue.digits=2,"age"="Age (years)","height"="Body height (cm)")

u2 <- univariateTable(location~age+AgeGroups+gender+height+weight,
                data=Diabetes)
summary(u2)
summary(u2,drop.reference=TRUE)
## same but more flexible
summary(u2,drop.reference=c("binary"))
## same but even more flexible
summary(u2,drop.reference=c("gender"))





