library(pillar)


### Name: colonnade
### Title: Format multiple vectors in a tabular display
### Aliases: colonnade squeeze

### ** Examples

colonnade(list(a = 1:3, b = letters[1:3]))

long_string <- list(paste(letters, collapse = " "))
colonnade(long_string, width = 20)
colonnade(long_string, has_row_id = FALSE, width = 20)

# The width can also be overridden when calling format() or print():
print(colonnade(long_string), width = 20)

# If width is larger than getOption("width"), multiple tiers are created:
colonnade(rep(long_string, 4), width = Inf)
squeeze(colonnade(long_string), width = 20)



