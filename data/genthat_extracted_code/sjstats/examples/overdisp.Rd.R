library(sjstats)


### Name: overdisp
### Title: Check overdispersion of GL(M)M's
### Aliases: overdisp zero_count

### ** Examples

library(sjmisc)
data(efc)

# response has many zero-counts, Poisson models
# might be overdispersed
barplot(table(efc$tot_sc_e))

fit <- glm(tot_sc_e ~ neg_c_7 + e42dep + c160age,
           data = efc, family = poisson)
overdisp(fit)
zero_count(fit)

library(lme4)
efc$e15relat <- to_factor(efc$e15relat)
fit <- glmer(tot_sc_e ~ neg_c_7 + e42dep + c160age + (1 | e15relat),
             data = efc, family = poisson)
overdisp(fit)
zero_count(fit)




