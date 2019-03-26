library(extdplyr)


### Name: ind_to_char
### Title: Convert indicator data.frame to character/factor.
### Aliases: ind_to_char ind_to_char_

### ** Examples

# Supports converting the following atomic types to indicator

df <- data.frame(integer_ind = c(2L, 0L, 0L, 0L, 0L, 0L),
                 # non-zero integer is 1, otherwise 0.
                 logcal_ind = c(FALSE, TRUE, FALSE, FALSE, FALSE, FALSE),
                 # TRUE is 1.
                 double_ind = c(0, 0, 2.0, 0, 0, 0),
                 # non-zero double is 1.
                 char_ind = c("FALSE", "FALSE", "F", "TRUE", "T", "FALSE"),
                 # "T" and "TRUE" converts to 1.
                 factor_ind = factor(c(1, 1, 1, 1, 1, 0), levels = c(0, 1),
                                     labels = c(TRUE, FALSE)),
                 # Factors are converted based on levels.
                 stringsAsFactors = FALSE)

ind_to_char_(df, col = "new_y", from = names(df), remove = FALSE)


# ind_to_char as complement to use model.matrix on a factor
df <- data.frame(x = 1:6, y = factor(c(letters[1:5], NA)))
ind_df <- as.data.frame(model.matrix(~ x + y - 1,
                                      model.frame(df, na.action = na.pass)))
ind_df  # an indicator matrix with NAs

# New character column is generated with non-selected columns kept as is.
ind_to_char(ind_df, new_y, ya:ye)
ind_to_char(ind_df, new_y, -x)
ind_to_char(ind_df, col = new_y, ya:ye, remove = FALSE)
# Returns a factor column
ind_to_char(ind_df, col = new_y, ya:ye, ret_factor = TRUE)

# Using SE
ind_to_char_(ind_df, col = "new_y", from = c("ya", "yb", "yc", "yd", "ye"))



