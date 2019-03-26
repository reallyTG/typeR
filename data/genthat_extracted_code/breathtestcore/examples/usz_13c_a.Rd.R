library(breathtestcore)


### Name: usz_13c_a
### Title: Exotic 13C breath test data
### Aliases: usz_13c_a
### Keywords: datasets

### ** Examples

## No test: 
library(dplyr)
library(ggplot2)
data(usz_13c_a)
d = usz_13c_a %>% 
  cleanup_data() %>% # recommended to test for validity
  nlme_fit()
plot(d)
## End(No test)



