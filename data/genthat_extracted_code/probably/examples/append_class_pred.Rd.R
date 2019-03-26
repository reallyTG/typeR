library(probably)


### Name: append_class_pred
### Title: Add a 'class_pred' column
### Aliases: append_class_pred

### ** Examples


# The following two examples are equivalent and demonstrate
# the helper, append_class_pred()

library(dplyr)

species_probs %>%
  mutate(
    .class_pred = make_class_pred(
      .pred_bobcat, .pred_coyote, .pred_gray_fox,
      levels = levels(Species),
      min_prob = .5
    )
  )

lvls <- levels(species_probs$Species)

append_class_pred(
  .data = species_probs,
  contains(".pred_"),
  levels = lvls,
  min_prob = .5
)




