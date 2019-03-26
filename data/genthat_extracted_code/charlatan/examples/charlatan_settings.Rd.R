library(charlatan)


### Name: charlatan_settings
### Title: charlatan settings
### Aliases: charlatan_settings

### ** Examples

charlatan_settings()
charlatan_settings(messy = TRUE)
charlatan_settings(messy = FALSE)

# with PersonProvider - overrides local messy param in all cases
x <- PersonProvider$new()
x$messy
charlatan_settings(messy = TRUE)
x <- PersonProvider$new()
x$messy



