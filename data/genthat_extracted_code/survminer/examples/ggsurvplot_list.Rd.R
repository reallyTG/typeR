library(survminer)


### Name: ggsurvplot_list
### Title: Plot a List of Survfit Objects
### Aliases: ggsurvplot_list

### ** Examples


library(survival)

# Create a list of formulas
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
data(colon)
f1 <- survfit(Surv(time, status) ~ adhere, data = colon)
f2 <- survfit(Surv(time, status) ~ rx, data = colon)
fits <- list(sex = f1, rx = f2)

# Visualize
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
legend.title <- list("sex", "rx")
ggsurvplot_list(fits, colon, legend.title = legend.title)




