library(blorr)


### Name: blr_decile_capture_rate
### Title: Event rate by decile
### Aliases: blr_decile_capture_rate

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_decile_capture_rate(gt)




