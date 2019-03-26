library(emmeans)


### Name: xtable.emmGrid
### Title: Using 'xtable' for EMMs
### Aliases: xtable.emmGrid xtable.summary_emm print.xtable_emm

### ** Examples

pigsint.lm <- lm(log(conc) ~ source * factor(percent), data = pigs)
pigsint.emm <- emmeans(pigsint.lm, ~ percent | source)
xtable::xtable(pigsint.emm, type = "response")



