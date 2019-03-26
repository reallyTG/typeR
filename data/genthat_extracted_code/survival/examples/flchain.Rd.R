library(survival)


### Name: flchain
### Title: Assay of serum free light chain for 7874 subjects.
### Aliases: flchain
### Keywords: datasets

### ** Examples

data(flchain)
age.grp <-  cut(flchain$age, c(49,54, 59,64, 69,74,79, 89, 110),
               labels= paste(c(50,55,60,65,70,75,80,90),
                             c(54,59,64,69,74,79,89,109), sep='-'))
table(flchain$sex, age.grp)



