library(R.utils)


### Name: subplots
### Title: Creates a grid of subplots
### Aliases: subplots.default subplots

### ** Examples

   subplots(nrow=2, ncol=3)  # 2-by-3 grid of subplots
   subplots(n=6, nrow=2)     # 2-by-3 grid of subplots
   subplots(n=5, ncol=2)     # 3-by-2 grid of subplots
   subplots(1)               # (Reset) to a 1-by-1 grid of subplots
   subplots(2)               # 1-by-2 grid of subplots
   subplots(3)               # 2-by-2 grid of subplots
   l <- subplots(8)          # 3-by-3 grid of subplots
   layout.show(length(l))



