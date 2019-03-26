library(wrapr)


### Name: qchar_frame
### Title: Build a quoted data.frame.
### Aliases: qchar_frame

### ** Examples


loss_name <- "loss"
x <- qchar_frame(
   measure,                      training,     validation |
   "minus binary cross entropy", .(loss_name), val_loss   |
   accuracy,                     acc,          val_acc    )
print(x)
str(x)
cat(draw_frame(x))

qchar_frame(
  x |
  1 |
  2 ) %.>% str(.)




