library(blorr)


### Name: blr_test_hosmer_lemeshow
### Title: Hosmer lemeshow test
### Aliases: blr_test_hosmer_lemeshow

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))

blr_test_hosmer_lemeshow(model)




