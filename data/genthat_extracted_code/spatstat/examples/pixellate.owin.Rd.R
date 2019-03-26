library(spatstat)


### Name: pixellate.owin
### Title: Convert Window to Pixel Image
### Aliases: pixellate.owin
### Keywords: spatial manip

### ** Examples

   data(letterR)
   plot(pixellate(letterR, dimyx=15))
   W <- grow.rectangle(as.rectangle(letterR), 0.2)
   plot(pixellate(letterR, W, dimyx=15))



