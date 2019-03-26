library(mosaicModel)


### Name: df_props
### Title: Joint and conditional proportions
### Aliases: df_props

### ** Examples

df_props(mtcars, ~ cyl + gear) 
df_props(mtcars, ~ cyl | gear)
df_props(mtcars, ~ cyl + gear, wide = TRUE)
df_props(mtcars, ~ cyl + gear, margins = TRUE)
df_props(mtcars, ~ cyl | gear, margins = TRUE)




