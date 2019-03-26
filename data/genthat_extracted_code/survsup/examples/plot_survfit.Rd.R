library(survsup)


### Name: plot_survfit
### Title: Plot a survfit object
### Aliases: plot_survfit

### ** Examples


library(survsup); library(ggplot2); library(dplyr); library(survival)

retinopathy %>%
    survfit(Surv(futime, status) ~ trt, data = .) %>%
   plot_survfit()

retinopathy %>%
    survfit(Surv(futime, status) ~ trt, data = .) %>%
   plot_survfit(ci = TRUE, cuminc = FALSE)

# Since a ggplot object is returned,
# you can tweak as you wish
# (in this case with multiple labels):
mgus2 %>%
     survfit(Surv(futime, death) ~ sex, data = .) %>%
     plot_survfit(cuminc = FALSE) %>%
     nar(flip = TRUE) %>%
     hcl_rainbow()+  # <--- Notice + sign here!
     labs(title = "This is an excessively long title",
     	subtitle = "This is a subtitle",
     	x = "Time (days)",
     	y = "Survival (%)",
     	caption = "(This is a demo)")



