library(skimr)


### Name: skim_with
### Title: Set or add the summary functions for a particular type of data
### Aliases: skim_with skim_with_defaults show_skimmers get_skimmers

### ** Examples

# Use new functions for numeric functions
skim_with(numeric = list(median = median, mad = mad), append = FALSE)
skim(faithful)

# If you want to remove a particular skimmer, set it to NULL
# This removes the inline histogram
skim_with(numeric = list(hist = NULL))
skim(faithful)

# This works with multiple skimmers. Just match names to overwrite
skim_with(numeric = list(iqr = IQR, p25 = NULL, p75 = NULL))
skim(faithful)

# Alternatively, set `append = FALSE` to replace the skimmers of a type.
skim_with(numeric = list(mean = mean, sd = sd), append = FALSE)

# Skimmers are unary functions. Partially apply arguments during assigment.
# For example, you might want to remove NA values.
skim_with(numeric = list(iqr = purrr::partial(IQR, na.rm = TRUE)))

# Or use an rlang-style formula constructor for the function
skim_with(numeric = list(med = ~median(., na.rm = TRUE)))

# Set multiple types of skimmers simultaneously
skim_with(numeric = list(mean = mean), character = list(len = length))

# Or pass the same as a list
my_skimmers <- list(numeric = list(mean = mean),
                    character = list(len = length))
skim_with(.list = my_skimmers)

# Alternatively, use rlang unquoting semantics
skim_with(!!!my_skimmers)

# Go back to defaults
skim_with_defaults()
skim(faithful)

# What are the names of the numeric skimmers?
show_skimmers("numeric")

# I want to create a set of skimmers for the hms class, using the date
# skimmers currently available.
funs <- get_skimmers()
skim_with(hms = funs$date)



