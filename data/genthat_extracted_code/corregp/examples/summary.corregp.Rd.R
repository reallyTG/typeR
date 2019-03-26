library(corregp)


### Name: summary.corregp
### Title: Summarizing Correspondence Regression
### Aliases: summary.corregp

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
summary(haireye.crg, add_ci = TRUE)
summary(haireye.crg, parm = "y", contrib = "pts_axs", nf = 2)
## End(No test)



