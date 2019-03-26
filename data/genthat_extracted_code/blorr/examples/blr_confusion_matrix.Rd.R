library(blorr)


### Name: blr_confusion_matrix
### Title: Confusion matrix
### Aliases: blr_confusion_matrix

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_confusion_matrix(model, cutoff = 0.4)




