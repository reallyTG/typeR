library(survsup)


### Name: nar
### Title: Add a numbers at risk table to a Kaplan-Meier plot
### Aliases: nar

### ** Examples

library(survsup); library(ggplot2); library(dplyr); library(survival)

retinopathy %>%
    survfit(Surv(futime, status) ~ trt, data = .) %>%
   plot_survfit() %>%
	   nar()

# Without table flip:
flchain %>%
    survfit(Surv(futime, death) ~ sex, data = .) %>%
   plot_survfit(cuminc = FALSE) %>%
   nar()

# With table flip:
flchain %>%
    survfit(Surv(futime, death) ~ sex, data = .) %>%
   plot_survfit(cuminc = FALSE) %>%
   nar(flip = TRUE)



