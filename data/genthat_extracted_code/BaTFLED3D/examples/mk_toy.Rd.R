library(BaTFLED3D)


### Name: mk_toy
### Title: Make a toy dataset to test the 3d BaTFLED model.
### Aliases: mk_toy

### ** Examples

data.params <- get_data_params(c('decomp=Tucker'))
toy <- mk_toy(data.params)

data.params <- get_data_params(c('decomp=CP'))
toy <- mk_toy(data.params)



