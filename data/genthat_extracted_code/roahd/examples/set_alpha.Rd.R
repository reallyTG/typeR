library(roahd)


### Name: set_alpha
### Title: Function to setup alpha value for a set of colours
### Aliases: set_alpha

### ** Examples


original_col = c( 'blue', 'red', 'green', 'yellow' )

alpha_col = set_alpha( original_col, 0.5 )

alpha_col = set_alpha( original_col, c(0.5, 0.5, 0.2, 0.1 ) )

dev.new()
par( mfrow = c( 1, 2 ) )

plot( seq_along( original_col ),
      seq_along( original_col ),
      col = original_col,
      pch = 16,
      cex = 2,
      main = 'Original colours' )

plot( seq_along( alpha_col ),
      seq_along( alpha_col ),
      col = alpha_col,
      pch = 16,
      cex = 2,
      main = 'Alpha colours' )




