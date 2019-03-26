library(MplusAutomation)


### Name: parseMplus
### Title: Check Mplus code for missing semicolons or too long lines.
### Aliases: parseMplus
### Keywords: utils

### ** Examples


# sample input
test <- "
MODEL:
  mpg ON wt hp;
  wt WITH hp
"
# check and return
cat(parseMplus(test), file=stdout(), fill=TRUE)
# add missing semicolons and return
cat(parseMplus(test, TRUE), file=stdout(), fill=TRUE)
test <- "
MODEL:
  mpg cyl disp hp drat wt qsec vs am gear PWITH cyl disp hp drat wt qsec vs am gear carb;
"
cat(parseMplus(test), file=stdout())



