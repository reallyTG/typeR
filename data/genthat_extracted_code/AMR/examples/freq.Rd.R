library(AMR)


### Name: freq
### Title: Frequency table
### Aliases: freq frequency_tbl top_freq print.frequency_tbl
### Keywords: freq frequency summarise summary

### ** Examples

library(dplyr)

# this all gives the same result:
freq(septic_patients$hospital_id)
freq(septic_patients[, "hospital_id"])
septic_patients$hospital_id %>% freq()
septic_patients[, "hospital_id"] %>% freq()
septic_patients %>% freq("hospital_id")
septic_patients %>% freq(hospital_id)  #<- easiest to remember when you're used to tidyverse

# you could also use `select` or `pull` to get your variables
septic_patients %>%
  filter(hospital_id == "A") %>%
  select(mo) %>%
  freq()

# multiple selected variables will be pasted together
septic_patients %>%
  left_join_microorganisms %>%
  filter(hospital_id == "A") %>%
  freq(genus, species)

# get top 10 bugs of hospital A as a vector
septic_patients %>%
  filter(hospital_id == "A") %>%
  freq(mo) %>%
  top_freq(10)

# save frequency table to an object
years <- septic_patients %>%
  mutate(year = format(date, "%Y")) %>%
  freq(year)

# show only the top 5
years %>% print(nmax = 5)

# save to an object with formatted percentages
years <- format(years)

# print a histogram of numeric values
septic_patients %>%
  freq(age) %>%
  hist()

# or print all points to a regular plot
septic_patients %>%
  freq(age) %>%
  plot()

# transform to a data.frame or tibble
septic_patients %>%
  freq(age) %>%
  as.data.frame()

# or transform (back) to a vector
septic_patients %>%
  freq(age) %>%
  as.vector()

identical(septic_patients %>%
            freq(age) %>%
            as.vector() %>%
            sort(),
          sort(septic_patients$age)) # TRUE

# it also supports `table` objects:
table(septic_patients$gender,
      septic_patients$age) %>%
  freq(sep = " **sep** ")

# check differences between frequency tables
diff(freq(septic_patients$trim),
     freq(septic_patients$trsu))

## Not run: 
##D # send frequency table to clipboard (e.g. for pasting in Excel)
##D septic_patients %>%
##D   freq(age) %>%
##D   format() %>%       # this will format the percentages
##D   clipboard_export()
## End(Not run)



