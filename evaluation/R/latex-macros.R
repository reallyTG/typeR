library(tidyverse)

PETA <- 10^15
TERA <- 10^12
GIGA <- 10^9
MEGA <- 10^6
KILO <- 10^3
HECTO <- 10^2
DECA <- 10^1
DECI <- 10^-1
CENTI <- 10^-2
MILLI <- 10^-3
MICRO <- 10^-6
NANO <- 10^-9
PICO <- 10^-12
SECONDS_PER_MINUTE <- 60
MINUTES_PER_HOUR <- 60
HOURS_PER_DAY <- 24
SECONDS_PER_HOUR <- SECONDS_PER_MINUTE * MINUTES_PER_HOUR
SECONDS_PER_DAY <- HOURS_PER_DAY * SECONDS_PER_HOUR

paste_round <- function(value, div, digits, suffix, sep = " ") {
    paste(round(value/div, digits), suffix, sep = sep)
}

memory_size_labels <-  function(x, digits = 1) {
    ifelse(x == 0, "0 B",
    { y <- log2(x)
        units <- c("B", "KB", "MB", "GB", "TB", "PB")
        unit <- units[y %/% 10 + 1]
        value <- 2 ^ (y %% 10)
        paste(round(value, digits), unit, sep = " ") })
}

count_labels <- Vectorize(function(x, digits = 2)
    if(is.na(x))       "NA"
    else if(x < 10^3)  paste0(x)
    else if(x < 10^6)  paste_round(x, 1000, digits, "K")
    else if(x < 10^9)  paste_round(x, 10^6, digits, "M")
    else if(x < 10^12) paste_round(x, 10^9, digits, "B")
    else               paste_round(x, 10^12, digits, "T"),
    "x")

relative_labels <- function(x) percent_labels(x * 100)

percent_labels <-  function(x) paste0(x, "%", sep="")

time_labels <- Vectorize(function(x, digits = 1)
    if (is.na(x))                   "NA"
    else if (x < NANO)              paste_round(x, PICO, digits, "ps")
    else if (x < MICRO)             paste_round(x, NANO, digits, "ns")
    else if (x < MILLI)             paste_round(x, MICRO, digits, "μs")
    else if(x < 1)                  paste_round(x, MILLI, digits, "ms")
    else if(x < SECONDS_PER_MINUTE) paste_round(x, 1, digits, "s")
    else if(x < SECONDS_PER_HOUR)   paste_round(x, SECONDS_PER_MINUTE, digits, "mins")
    else if(x < SECONDS_PER_DAY)    paste_round(x, SECONDS_PER_HOUR, digits, "hours")
    else                            paste_round(x, SECONDS_PER_DAY, digits, "days"),
    "x")

format_as_percentage <- function(x, digits = 1) {
    rounded <- round(x, digits = digits)
    first_decimal_digit = as.integer(rounded * 10) %% 10
    str_c(format(100 * x,
                 digits = digits,
                 nsmall = first_decimal_digit != 0,
                 scientific = FALSE), "%")
}

format_as_absolute <- function(x, digits = 1) count_labels(x, digits)

format_as_size <- function(x, digits = 1) memory_size_labels(x, digits)


## Latex Macro Generation
## name prefix is one of:
## - Perc - adds a % at the end
## - Count - adds labels like K, M, B for Kilo, Million and Billion
## - Size - adds lables like KB, MB, GB for memory sizes
generate_macro <- function(macro_name, value, latex_macro_filepath, subst = TRUE) {
    if(subst) {
        name <- as.character(substitute(macro_name))
    } else {
        name <- macro_name
    }
    if (str_sub(name, 1, 4) == "Perc")      formatted_value <- format_as_percentage(value)
    else if(str_sub(name, 1, 5) == "Count") formatted_value <- format_as_absolute(value)
    else if(str_sub(name, 1, 4) == "Size")  formatted_value <- format_as_size(value)
    else stop(str_c("Unidentified name", name, sep = " "))
    formatted_value <- str_replace(formatted_value, "\\%", "\\\\%")
    definition <- str_glue("\\newcommand {{\\{name}}} {{{formatted_value}\\xspace}} %% {value}")
    write_lines(definition, latex_macro_filepath, append = TRUE)
}
