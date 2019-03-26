library(MEMSS)
options(show.signif.stars = FALSE, digits = 3)
old_optimizer = lmerControl(optimizer = "bobyqa")  # use an older default

m1 <- lmer(pixel ~ day + I(day^2) + (1|Dog:Side) + (day|Dog),
           Pixel, control = old_optimizer)
print(m1, corr = FALSE)
unclass(ranef(m1))
