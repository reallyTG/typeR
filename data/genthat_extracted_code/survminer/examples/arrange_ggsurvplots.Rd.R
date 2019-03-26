library(survminer)


### Name: arrange_ggsurvplots
### Title: Arranging Multiple ggsurvplots
### Aliases: arrange_ggsurvplots

### ** Examples


# Fit survival curves
require("survival")
fit<- survfit(Surv(time, status) ~ sex, data = lung)

# List of ggsurvplots
require("survminer")
splots <- list()
splots[[1]] <- ggsurvplot(fit, data = lung, risk.table = TRUE, ggtheme = theme_minimal())
splots[[2]] <- ggsurvplot(fit, data = lung, risk.table = TRUE, ggtheme = theme_grey())

# Arrange multiple ggsurvplots and print the output
arrange_ggsurvplots(splots, print = TRUE,
  ncol = 2, nrow = 1, risk.table.height = 0.4)

## Not run: 
##D # Arrange and save into pdf file
##D res <- arrange_ggsurvplots(splots, print = FALSE)
##D ggsave("myfile.pdf", res)
## End(Not run)





