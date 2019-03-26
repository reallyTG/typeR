library(mortAAR)


### Name: prep.life.table
### Title: Creates the input for the function life.table.
### Aliases: prep.life.table

### ** Examples

# Separate age ranges in your data set.
df <- dplyr::mutate(
  tidyr::separate(
    replace(
     magdalenenberg,
     magdalenenberg=="60-x", "60-69"
    ),
    a,
    c("from", "to")
  ),
  from = as.numeric(from),
  to = as.numeric(to)
)

# Apply prep.life.table to a data set containing the age ranges.
magda_prep <- prep.life.table(
  df,
  dec = "Dx",
  agebeg = "from",
  ageend = "to",
  method = "Equal5",
  agerange = "included"
)

# Create a life.table.
life.table(magda_prep)




