library(esc)


### Name: esc_d2logit
### Title: Convert effect size d into log odds
### Aliases: esc_d2logit

### ** Examples

# to logits
esc_d2logit(0.7, se = 0.5)

# to Cox-logits
esc_d2logit(0.7, v = 0.25, es.type = "cox")




