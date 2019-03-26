library(packHV)


### Name: desc
### Title: Making descriptive statistics
### Aliases: desc

### ** Examples

cgd$steroids=factor(cgd$steroids)
cgd$status=factor(cgd$status)
desc(cgd,vars=c("center","sex","age","height","weight","steroids","status"),group="treat")



