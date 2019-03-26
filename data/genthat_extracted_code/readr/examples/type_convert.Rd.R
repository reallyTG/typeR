library(readr)


### Name: type_convert
### Title: Re-convert character columns in existing data frame
### Aliases: type_convert

### ** Examples

df <- data.frame(
  x = as.character(runif(10)),
  y = as.character(sample(10)),
  stringsAsFactors = FALSE
)
str(df)
str(type_convert(df))

df <- data.frame(x = c("NA", "10"), stringsAsFactors = FALSE)
str(type_convert(df))

# Type convert can be used to infer types from an entire dataset

# first read the data as character
data <- read_csv(readr_example("mtcars.csv"),
                 col_types = cols(.default = col_character()))
str(data)
# Then convert it with type_convert
type_convert(data)



