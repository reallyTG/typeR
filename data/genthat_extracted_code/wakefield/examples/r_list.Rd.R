library(wakefield)


### Name: r_list
### Title: List Production (From Variable Functions)
### Aliases: r_list
### Keywords: list

### ** Examples

r_list(
    n = 30,
    id,
    race,
    age,
    sex,
    hour,
    iq,
    height,
    died,
    Scoring = rnorm
)

r_list(
    n = 30,
    id,
    race,
    age(x = 8:14),
    Gender = sex,
    Time = hour,
    iq,
    height(mean=50, sd = 10),
    died,
    Scoring = rnorm
)



