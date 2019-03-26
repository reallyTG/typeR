library(survminer)


### Name: add_ggsurvplot
### Title: Add Components to a ggsurvplot
### Aliases: add_ggsurvplot +.ggsurv %++%

### ** Examples

# Fit survival curves
require("survival")
fit<- survfit(Surv(time, status) ~ sex, data = lung)

# Basic survival curves
p <- ggsurvplot(fit, data = lung, risk.table = TRUE,
   main = "Survival curve",
   submain = "Based on Kaplan-Meier estimates",
   caption = "created with survminer"
   )
p

# Customizing the plots
p + theme_survminer(
     font.main = c(16, "bold", "darkblue"),
     font.submain = c(15, "bold.italic", "purple"),
     font.caption = c(14, "plain", "orange"),
     font.x = c(14, "bold.italic", "red"),
     font.y = c(14, "bold.italic", "darkred"),
     font.tickslab = c(12, "plain", "darkgreen")
)



