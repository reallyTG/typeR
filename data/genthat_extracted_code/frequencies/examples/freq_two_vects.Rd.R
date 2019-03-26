library(frequencies)


### Name: freq_two_vects
### Title: freq_two_vects
### Aliases: freq_two_vects

### ** Examples

# Sample data frame to demo the freq_two_vects function.
df <- data.frame(gender = sample(c('m','f'), 200, replace = TRUE),
                 ethnicity = sample(c('african american', 'asian', 'caucasian',
                                   'hispanic', 'other'),
                                   200, replace = TRUE),
                 stringsAsFactors = FALSE)

freq_two_vects(df, gender, ethnicity, FALSE)
gender_by_ethnicity <- freq_two_vects(df, gender, ethnicity, TRUE)
gender_by_ethnicity$m
freq_two_vects(df, gender, ethnicity, TRUE)$m
freq_two_vects(df, ethnicity, gender, FALSE)
ethnicity_by_gender <- freq_two_vects(df, ethnicity, gender, TRUE)
ethnicity_by_gender$asian



