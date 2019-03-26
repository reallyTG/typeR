library(survminer)


### Name: theme_survminer
### Title: Theme for Survminer Plots
### Aliases: theme_survminer theme_cleantable

### ** Examples


# Fit survival curves
#++++++++++++++++++++++++++++++++++++
require("survival")
fit<- survfit(Surv(time, status) ~ sex, data = lung)

# Basic survival curves
#++++++++++++++++++++++++++++++++++++
ggsurv <- ggsurvplot(fit, data = lung, risk.table = TRUE,
   main = "Survival curves",
   submain = "Based on Kaplan-Meier estimates",
   caption = "created with survminer"
   )

# Change font size, style and color
#++++++++++++++++++++++++++++++++++++
# Change font size, style and color at the same time
# Use font.x = 14, to change only font size; or use
# font.x = "bold", to change only font face.
ggsurv %+% theme_survminer(
     font.main = c(16, "bold", "darkblue"),
     font.submain = c(15, "bold.italic", "purple"),
     font.caption = c(14, "plain", "orange"),
     font.x = c(14, "bold.italic", "red"),
     font.y = c(14, "bold.italic", "darkred"),
     font.tickslab = c(12, "plain", "darkgreen")
   )

# Clean risk table
# +++++++++++++++++++++++++++++
ggsurv$table <- ggsurv$table + theme_cleantable()
ggsurv




