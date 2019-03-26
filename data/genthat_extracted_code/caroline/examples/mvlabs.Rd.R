library(caroline)


### Name: mvlabs
### Title: Move Text Labels Interactively
### Aliases: mvlabs

### ** Examples

  x <- rnorm(20); y <- rnorm(20)
  df <- data.frame(x,y, lab=as.character(letters[1:20]))
  plot(df$x, df$y, pch=''); text(df$x, df$y, df$lab)
  ## df <- mvlabs(df, 'x','y','lab', n=3)  
  plot(df$x, df$y, pch=''); text(df$x, df$y, df$lab)



