library(sitar)


### Name: heights
### Title: Serial heights measured in 12 girls
### Aliases: heights
### Keywords: datasets

### ** Examples

  require(graphics)
  data(heights)
  coplot(height ~ age | id, data = heights, panel=panel.smooth,
    show.given=FALSE, xlab='age (years)', ylab='height (cm)', pch=19)



