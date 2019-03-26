library(broom)


### Name: augment.decomposed.ts
### Title: Augment data with information from a(n) decomposed.ts object
### Aliases: augment.decomposed.ts decompose_tidiers

### ** Examples


# Time series of temperatures in Nottingham, 1920-1939:
nottem

# Perform seasonal decomposition on the data with both decompose
# and stl:
d1 <- stats::decompose(nottem)
d2 <- stats::stl(nottem, s.window = "periodic", robust = TRUE)

# Compare the original series to its decompositions.

cbind(broom::tidy(nottem), broom::augment(d1),
      broom::augment(d2))

# Visually compare seasonal decompositions in tidy data frames.

library(tibble)
library(dplyr)
library(tidyr)
library(ggplot2)

decomps <- tibble(
    # Turn the ts objects into data frames.
    series = list(as.data.frame(nottem), as.data.frame(nottem)),
    # Add the models in, one for each row.
    decomp = c("decompose", "stl"),
    model = list(d1, d2)
) %>%
    rowwise() %>%
    # Pull out the fitted data using broom::augment.
    mutate(augment = list(broom::augment(model))) %>%
    ungroup() %>%
    # Unnest the data frames into a tidy arrangement of
    # the series next to its seasonal decomposition, grouped
    # by the method (stl or decompose).
    group_by(decomp) %>%
    unnest(series, augment) %>%
    mutate(index = 1:n()) %>%
    ungroup() %>%
    select(decomp, index, x, adjusted = .seasadj)

ggplot(decomps) +
    geom_line(aes(x = index, y = x), colour = "black") +
    geom_line(aes(x = index, y = adjusted, colour = decomp,
                  group = decomp))




