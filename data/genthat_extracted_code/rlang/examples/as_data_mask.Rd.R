library(rlang)


### Name: as_data_mask
### Title: Create a data mask
### Aliases: as_data_mask as_data_pronoun new_data_mask

### ** Examples

# Evaluating in a tidy evaluation environment enables all tidy
# features:
mask <- as_data_mask(mtcars)
eval_tidy(quo(letters), mask)

# You can install new pronouns in the mask:
mask$.pronoun <- as_data_pronoun(list(foo = "bar", baz = "bam"))
eval_tidy(quo(.pronoun$foo), mask)

# In some cases the data mask can leak to the user, for example if
# a function or formula is created in the data mask environment:
cyl <- "user variable from the context"
fn <- eval_tidy(quote(function() cyl), mask)
fn()

# If new objects are created in the mask, they persist in the
# subsequent calls:
eval_tidy(quote(new <- cyl + am), mask)
eval_tidy(quote(new * 2), mask)


# In some cases your data mask is a whole chain of environments
# rather than a single environment. You'll have to use
# `new_data_mask()` and let it know about the bottom of the mask
# (the last child of the environment chain) and the topmost parent.

# A common situation where you'll want a multiple-environment mask
# is when you include functions in your mask. In that case you'll
# put functions in the top environment and data in the bottom. This
# will prevent the data from overwriting the functions.
top <- new_environment(list(`+` = base::paste, c = base::paste))

# Let's add a middle environment just for sport:
middle <- env(top)

# And finally the bottom environment containing data:
bottom <- env(middle, a = "a", b = "b", c = "c")

# We can now create a mask by supplying the top and bottom
# environments:
mask <- new_data_mask(bottom, top = top)

# This data mask can be passed to eval_tidy() instead of a list or
# data frame:
eval_tidy(quote(a + b + c), data = mask)

# Note how the function `c()` and the object `c` are looked up
# properly because of the multi-level structure:
eval_tidy(quote(c(a, b, c)), data = mask)

# new_data_mask() does not create data pronouns, but
# data pronouns can be added manually:
mask$.fns <- as_data_pronoun(top)

# The `.data` pronoun should generally be created from the
# mask. This will ensure data is looked up throughout the whole
# ancestry. Only non-function objects are looked up from this
# pronoun:
mask$.data <- as_data_pronoun(mask)
mask$.data$c

# Now we can reference the values with the pronouns:
eval_tidy(quote(c(.data$a, .data$b, .data$c)), data = mask)



