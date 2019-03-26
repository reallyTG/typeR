library(bioset)


### Name: sets_read
### Title: Read sets and calculate concentrations and variability.
### Aliases: sets_read

### ** Examples

# files "set_1.csv" and "set_2.csv" containing raw values and the
# corresponding lables (consisting of ID and point in time like
# "ID_TIME")
read.csv(
  file = system.file("extdata", "set_1.csv", package = "bioset"),
  header = FALSE,
  colClasses = "character"
)
read.csv(
  file = system.file("extdata", "set_2.csv", package = "bioset"),
  header = FALSE,
  colClasses = "character"
)

# the known concentration of the calibrators contained in these plates
cals <- c(10, 20, 30, 40)      # ng / ml
names(cals) <- c("CAL1", "CAL2", "CAL3", "CAL4")

# read both files into a tibble
# columns "ID" and "time" separated by "_"
# and calculate concentrations using the calibrators
result <- sets_read(
  sets = 2,                      # expect 2 plates
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("ID", "time"),  # expect the labels to contain ID and
                                      # point in time
  additional_sep = "_",               # separated by "_"
  cal_names = names(cals),       # that's what they're called in the files
  cal_values = cals,             # the concentration has to be known
  write_data = FALSE             # do not store the results in csv-files
)

# inspect results (all values contained in the two original files)
result$all
# (all values except CAL1-4)
result$samples
# inspect goodness of fit
# for plate 1
result$set_1$plot
result$set_1$model
# for plate 2
result$set_2$plot
result$set_2$model



