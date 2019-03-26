library(x3ptools)


### Name: x3p_to_df
### Title: Convert an x3p file into a data frame
### Aliases: x3p_to_df

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
logo_df <- x3p_to_df(logo)
head(logo_df)



