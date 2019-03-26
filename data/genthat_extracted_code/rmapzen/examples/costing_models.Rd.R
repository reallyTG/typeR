library(rmapzen)


### Name: costing_models
### Title: Costing model constructors and helpers
### Aliases: costing_models mz_costing mz_costing_options
### Keywords: datasets

### ** Examples

## creates a pedestrian costing model with walking speed of 2 km/hr
## that also avoids alleys.
## non-multimodal costing models will accept 0 or more options from the
## appropriate list.
mz_costing$pedestrian(
    mz_costing_options$pedestrian$walking_speed(2.0),
    mz_costing_options$pedestrian$alley_factor(0)
)

## creates a multimodal costing model that favors buses over rails, and
## has a slower than default walking speed
## (note multimodal has named arguments requiring list inputs)
mz_costing$multimodal(
    transit = list(
        mz_costing_options$transit$use_bus(1.0),
        mz_costing_options$transit$use_rail(5)
    ),
    pedestrian = list(
        mz_costing_options$pedestrian$walking_speed(4.1)
    )
)



