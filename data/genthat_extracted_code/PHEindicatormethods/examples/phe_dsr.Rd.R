library(PHEindicatormethods)


### Name: phe_dsr
### Title: phe_dsr
### Aliases: phe_dsr

### ** Examples

library(dplyr)
df <- data.frame(indicatorid = rep(c(1234, 5678, 91011, 121314), each = 19 * 2 * 5),
                 year = rep(2006:2010, each = 19 * 2),
                 sex = rep(rep(c("Male", "Female"), each = 19), 5),
                 ageband = rep(c(0,5,10,15,20,25,30,35,40,45,
                                 50,55,60,65,70,75,80,85,90), times = 10),
                 obs = sample(200, 19 * 2 * 5 * 4, replace = TRUE),
                 pop = sample(10000:20000, 19 * 2 * 5 * 4, replace = TRUE))
df %>%
    group_by(indicatorid, year, sex) %>%
    phe_dsr(obs, pop)

## OR

df %>%
    group_by(indicatorid, year, sex) %>%
    phe_dsr(obs, pop, type = "full")




