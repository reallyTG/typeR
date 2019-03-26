library(blorr)


### Name: blr_gains_table
### Title: Gains table & lift chart
### Aliases: blr_gains_table plot.blr_gains_table

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
# gains table
blr_gains_table(model)

# lift chart
k <- blr_gains_table(model)
plot(k)




