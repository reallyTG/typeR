library(biostat3)


### Name: survPHplot
### Title: Plot to assess non-proportionality
### Aliases: survPHplot
### Keywords: survival

### ** Examples

survPHplot(Surv(surv_mm/12, status == "Dead: cancer") ~ year8594,
           data=colon, subset=(stage=="Localised"),
           legend.args=list(bty="n"))



