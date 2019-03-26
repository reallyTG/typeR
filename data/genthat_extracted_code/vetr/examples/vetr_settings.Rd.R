library(vetr)


### Name: vetr_settings
### Title: Generate Control Settings For vetr and alike
### Aliases: vetr_settings

### ** Examples

type_alike(1L, 1.0, settings=vetr_settings(type.mode=2))
## better if you are going to re-use settings to reduce overhead
set <- vetr_settings(type.mode=2)
type_alike(1L, 1.0, settings=set)



