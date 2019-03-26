library(wakefield)


### Name: table_heat
### Title: View Data Table Column Types as Heat Map
### Aliases: table_heat
### Keywords: class, type

### ** Examples

table_heat(mtcars) #boring
table_heat(CO2)
table_heat(iris)
table_heat(state_populations)

dat <- r_data_frame(100,
    lorem_ipsum,
    birth,
    animal,
    age,
    grade, grade,
    death,
    dummy,
    grade_letter
)

table_heat(dat)
table_heat(dat, flip=TRUE)

table_heat(r_data_theme(), flip=TRUE)

## NA values
table_heat(r_na(dat, NULL))

## Colors
table_heat(r_na(dat, NULL), palette = NULL)
table_heat(r_na(dat, NULL), palette = "Set1")
table_heat(r_na(dat, NULL), palette = "Set2")
table_heat(r_na(dat, NULL), palette = "Set1")
table_heat(r_na(dat, NULL), palette = "Dark2")
table_heat(r_na(dat, NULL), palette = "Spectral")
table_heat(r_na(dat, NULL), palette = "Reds")



