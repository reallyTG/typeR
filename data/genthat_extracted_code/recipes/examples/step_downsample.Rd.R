library(recipes)


### Name: step_downsample
### Title: Down-Sample a Data Set Based on a Factor Variable
### Aliases: step_downsample tidy.step_downsample
### Keywords: datagen

### ** Examples

data(okc)

sort(table(okc$diet, useNA = "always"))

ds_rec <- recipe( ~ ., data = okc) %>%
  step_downsample(diet) %>%
  prep(training = okc, retain = TRUE)

table(juice(ds_rec)$diet, useNA = "always")

# since `skip` defaults to TRUE, baking the step has no effect
baked_okc <- bake(ds_rec, new_data = okc)
table(baked_okc$diet, useNA = "always")



