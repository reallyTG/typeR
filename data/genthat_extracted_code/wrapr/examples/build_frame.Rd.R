library(wrapr)


### Name: build_frame
### Title: Build a data.frame from the user's description.
### Aliases: build_frame

### ** Examples


tc_name <- "training"
x <- build_frame(
   "measure",                   tc_name, "validation" |
   "minus binary cross entropy",      5, -7           |
   "accuracy",                      0.8, 0.6          )
print(x)
str(x)
cat(draw_frame(x))

build_frame(
  "x" |
  -1  |
  2   )




