library(circumplex)


### Name: ssm_append
### Title: Combine SSM tables
### Aliases: ssm_append

### ** Examples

data("jz2017")
res1 <- ssm_analyze(jz2017, PA:NO, octants())
res2 <- ssm_analyze(jz2017, PA:NO, octants(), grouping = Gender)
tab1 <- ssm_table(res1, render = FALSE)
tab2 <- ssm_table(res2, render = FALSE)
ssm_append(tab1, tab2)



