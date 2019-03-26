library(Observation)


### Name: data_collection_program
### Title: Collect Direct Observation Data
### Aliases: data_collection_program

### ** Examples

if (interactive()) {
data_collection_program()
}

# Load Sample of interactively-collected data for comparison
#    with manually-entered data

data("example_data")

# Example of manually defining input variables -------------------------

id <- "Test_ID"

timestamps <- c("2018-05-06 02:40:37", "2018-05-06 02:40:46",
    "2018-05-06 02:40:59", "2018-05-06 02:41:14",
    "2018-05-06 02:41:27", "2018-05-06 02:41:37",
    "2018-05-06 02:41:48", "2018-05-06 02:42:03",
    "2018-05-06 02:42:24", "2018-05-06 02:42:39",
    "2018-05-06 02:42:53")

activities <- c("sitting still", "sitting stretching",
    "sitting shoulder press", "sitting cycling",
    "standing still", "standing stretching",
    "standing shoulder press", "walking slowly",
    "walking quickly", "jumping jacks")

durations <- c(9, 13, 15, 13, 10, 11, 15, 21, 15, 14.460825920105)

Tree_Intensity <- c("Sedentary", "Sedentary/Light",
    "Light/Moderate", "Indeterminate", "Light", "Light",
    "Light/Moderate", "Light", "MVPA", "Light/Moderate")

seated <- c("yes", "yes", "yes", "yes", "no", "no", "no",
    "no", "no", "no")

large_muscles_moving <- c("no", "yes", "yes", "yes",
    "no", "yes", "yes", "yes", "yes", "yes")

slow <- c(NA, "yes", "yes", "no", NA, "yes", "yes",
    "no", "no", "no")

slowed_by_resistance <- c(NA, "no", "yes", NA, NA,
    "no", "yes", NA, NA, NA)

ambulation <- c(NA, NA, NA, NA, NA, NA, NA,
    "yes", "yes", "no")

light_walking <- c(NA, NA, NA, NA, NA, NA,
    NA, "yes", "no", NA)

# Example of using the manual program ----------------------------------

manual_data <- data_collection_program(interactive = FALSE,
    id = id, timestamps = timestamps,
    activities = activities, durations = durations,
    seated = seated, large_muscles_moving = large_muscles_moving,
    slow = slow, slowed_by_resistance = slowed_by_resistance,
    ambulation = ambulation, light_walking = light_walking,
    rational = TRUE, format = "%Y-%m-%d %H:%M:%S")

# Comparing output of interactive vs manual program --------------------

test_names <- intersect(names(example_data), names(manual_data))
test_names <- setdiff(names(test_names),
    c("dayofyear", "minofday", "duration_s"))

all.equal(example_data[ ,test_names],
    manual_data[ ,test_names])



