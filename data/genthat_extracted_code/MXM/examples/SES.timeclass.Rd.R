library(MXM)


### Name: Feature selection using SES and MMPC for classifiication with longitudinal data
### Title: Feature selection using SES and MMPC for classifiication with
###   longitudinal data
### Aliases: SES.timeclass MMPC.timeclass
### Keywords: SES Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

## assume these are longitudinal data, each column is a variable (or feature)
dataset <- matrix( rnorm(400 * 100), ncol = 100 ) 
id <- rep(1:80, each = 5)  ## 80 subjects
reps <- rep( seq(4, 12, by = 2), 80)  ## 5 time points for each subject
## dataset contains are the regression coefficients of each subject's values on the 
## reps (which is assumed to be time in this example)
target <- rep(0:1, each = 200)
a <- MMPC.timeclass(target, reps, id, dataset)



