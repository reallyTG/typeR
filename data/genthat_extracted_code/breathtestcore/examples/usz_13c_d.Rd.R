library(breathtestcore)


### Name: usz_13c_d
### Title: 13C breath test data with MRI emptying for comparison
### Aliases: usz_13c_d
### Keywords: datasets

### ** Examples

## No test: 
library(dplyr)
library(ggplot2)
data(usz_13c_d)
mri_t50 = attr(usz_13c_d, "mri_t50")
d = usz_13c_d %>% 
  cleanup_data() %>% # recommended to test for validity
  nlme_fit()
plot(d) +
  geom_vline(data = mri_t50, aes(xintercept = t50), linetype = 2)

# Maes-Ghoos t50
dd = mri_t50 %>% 
  inner_join(
    coef(d) %>% filter(parameter=="t50", method == "maes_ghoos"),
    by = c("patient_id", "group")) %>% 
  mutate(
    t50_maes_ghoos = value
 )

ggplot(dd, aes(x=t50, y = t50_maes_ghoos, color = group)) +  
  geom_point() +
  facet_wrap(~group) +
  geom_abline(slope = 1, intercept = 0) +
  xlim(45,205) +
  ylim(45,205) 

# Bluck-Coward t50
dd = mri_t50 %>% 
  inner_join(
    coef(d) %>% filter(parameter=="t50", method == "bluck_coward"),
    by = c("patient_id", "group")) %>% 
  mutate(
    t50_bluck_coward = value
 )

ggplot(dd, aes(x=t50, y = t50_bluck_coward, color = group)) +  
  geom_point() +
  facet_wrap(~group) +
  geom_abline(slope = 1, intercept = 0) +
  xlim(0,205) +
  ylim(0,205) 
## End(No test)



