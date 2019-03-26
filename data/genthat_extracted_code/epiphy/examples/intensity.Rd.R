library(epiphy)


### Name: intensity
### Title: Construct count, incidence and severity objects.
### Aliases: intensity count count_data incidence incidence_data severity
###   severity_data

### ** Examples

## Create intensity objects
# Implicite call: The variable mapping does not need to be specified if the
# column names of the input data frame follow the default names.
colnames(tomato_tswv$field_1929) # Returns c("x", "y", "t", "i", "n")
my_incidence_1 <- incidence(tomato_tswv$field_1929)
my_incidence_1
my_incidence_2 <- incidence(tomato_tswv$field_1929,
                            mapping(x = x, y = y, t = t, i = i, n = n))
identical(my_incidence_1, my_incidence_2)

# Explicite call: Otherwise, the variable mapping need to be specified, at
# least for column names that do not correspond to default names.
colnames(aphids) # Returns c("xm", "ym", "i")
my_count_1 <- count(aphids, mapping(x = xm, y = ym, i = i))
my_count_1
# We can drop the "i = i" in the mapping.
my_count_2 <- count(aphids, mapping(x = xm, y = ym))
identical(my_count_1, my_count_2)

# It is possible to change the variable mapping after the creation of an
# intensity object:
another_incidence <- incidence(hop_viruses$HpLV)
another_incidence
remap(another_incidence, mapping(x = xm, y = ym))

## Plotting data
plot(my_incidence_1) # Same as: plot(my_incidence_1, type = "spatial")
plot(my_incidence_1, type = "temporal")

plot(my_count_1, tile = FALSE, size = 5)
plot(my_count_1, type = "temporal") # Not possible: there is only 1 date.

# Using grayscale:
plot(my_count_1, grayscale = TRUE)
plot(my_count_1, grayscale = TRUE, tile = FALSE, size = 5)




