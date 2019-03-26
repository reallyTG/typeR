library(wrapr)


### Name: draw_frame
### Title: Render a simple data.frame in build_frame format.
### Aliases: draw_frame

### ** Examples


tc_name <- "training"
x <- build_frame(
  "measure"                   , tc_name, "validation", "idx" |
  "minus binary cross entropy", 5      , 7           , 1L    |
  "accuracy"                  , 0.8    , 0.6         , 2L    )
print(x)
cat(draw_frame(x))





