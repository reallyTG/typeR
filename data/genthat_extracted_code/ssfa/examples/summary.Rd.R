library(ssfa)


### Name: summary
### Title: SSFA summaries
### Aliases: print.ssfa summary.ssfa print.summary.ssfa

### ** Examples

library(ssfa) 
data(SSFA_example_data)
data(Italian_W)
ssfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, 
             data_w=Italian_W, form = "production", par_rho=TRUE)

print(ssfa)
summary(ssfa)



