library(wakefield)


### Name: r_na
### Title: Replace a Proportion of Values With NA
### Aliases: r_na
### Keywords: missing na

### ** Examples

r_na(mtcars)
r_na(mtcars, NULL)


library(dplyr)

r_data_frame(
    n = 30,
    id,
    race,
    age,
    sex,
    hour,
    iq,
    height,
    died,
    Scoring = rnorm,
    Smoker = valid
) %>%
    r_na(prob=.4)



