library(metagen)


### Name: plotStudyQfuncPfunc
### Title: Example: Plotting the q- and p-function from the dissertation
### Aliases: plotStudyQfuncPfunc

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_s <- bcg$size
bcg_x <- cbind(1,bcg$x)
p <- plotStudyQfuncPfunc(y=bcg_y, d=bcg_d, x=bcg_x, n=500)
p[1] # plot of the q-function
p[2] # plot of the p-funciton



