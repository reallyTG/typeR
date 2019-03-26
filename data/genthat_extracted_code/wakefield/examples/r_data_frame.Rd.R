library(wakefield)


### Name: r_data_frame
### Title: Data Frame Production (From Variable Functions)
### Aliases: r_data_frame

### ** Examples

r_data_frame(n = 30,
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
)

r_data_frame(n = 30,
    id,
    race,
    age(x = 8:14),
    Gender = sex,
    Time = hour,
    iq,
    grade, grade, grade,  #repeated measures
    height(mean=50, sd = 10),
    died,
    Scoring = rnorm,
    Smoker = valid
)

r_data_frame(n = 500,
    id,
    age, age, age,
    grade, grade, grade
)

## Repeated Measures/Time Series
r_data_frame(n=100,
    id,
    age,
    sex,
    r_series(likert, 3),
    r_series(likert, 4, name = "Item", integer = TRUE)
)

## Expanded Dummy Coded Variables
r_data_frame(n=100,
    id,
    age,
    r_dummy(sex, prefix=TRUE),
    r_dummy(political)
)

## `peek` to view al columns
## `plot` (`table_heat`) for a graphic representation
library(dplyr)
r_data_frame(n=100,
    id,
    dob,
    animal,
    grade, grade,
    death,
    dummy,
    grade_letter,
    gender,
    paragraph,
    sentence
) %>%
   r_na() %>%
   peek %>%
   plot(palette = "Set1")



