library(finalfit)


### Name: boot_predict
### Title: Bootstrap simulation for model prediction
### Aliases: boot_predict

### ** Examples

library(finalfit)
library(dplyr)

# Predict probability of death across combinations of factor levels
explanatory = c("age.factor", "extent.factor", "perfor.factor")
dependent = 'mort_5yr'

# Generate combination of factor levels
colon_s %>%
  finalfit_newdata(explanatory = explanatory, newdata = list(
    c("<40 years",  "Submucosa", "No"),
    c("<40 years", "Submucosa", "Yes"),
    c("<40 years", "Adjacent structures", "No"),
    c("<40 years", "Adjacent structures", "Yes")
   )) -> newdata

# Run simulation
colon_s %>%
  glmmulti(dependent, explanatory) %>%
  boot_predict(newdata, estimate_name = "Predicted probability of death",
    compare_name = "Absolute risk difference", R=100, digits = c(2,3))

# Plotting
explanatory = c("nodes", "extent.factor", "perfor.factor")
colon_s %>%
  finalfit_newdata(explanatory = explanatory, rowwise = FALSE, newdata = list(
  rep(seq(0, 30), 4),
  c(rep("Muscle", 62), rep("Adjacent structures", 62)),
  c(rep("No", 31), rep("Yes", 31), rep("No", 31), rep("Yes", 31))
)) -> newdata

colon_s %>%
  glmmulti(dependent, explanatory) %>%
  boot_predict(newdata, boot_compare = FALSE, R=100, condense=FALSE) -> plot

  library(ggplot2)
  theme_set(theme_bw())
  plot %>%
    ggplot(aes(x = nodes, y = estimate, ymin = estimate_conf.low,
        ymax = estimate_conf.high, fill=extent.factor))+
      geom_line(aes(colour = extent.factor))+
      geom_ribbon(alpha=0.1)+
      facet_grid(.~perfor.factor)+
      xlab("Number of postive lymph nodes")+
      ylab("Probability of death")+
      labs(fill = "Extent of tumour", colour = "Extent of tumour")+
      ggtitle("Probability of death by lymph node count")



